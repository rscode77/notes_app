import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import 'package:notes_app/app_constants.dart';
import 'package:notes_app/features/notes/domain/data/entities/note.dart';
import 'package:notes_app/features/notes/presentation/widgets/note_importance.dart';

import '../../blocs/bloc/notes_bloc.dart';
import '../widgets/custom_button.dart';
import '../widgets/note_description.dart';
import '../widgets/note_title.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final importanceController = TextEditingController();

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 30.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Note',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('d MMMM').format(DateTime.now()),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                Gap(20.h),
                //Title
                NoteTitle(
                  titleController: titleController,
                ),
                Gap(20.h),
                //Description
                NoteDescription(
                  descriptionController: descriptionController,
                ),
                Gap(20.h),
                //Importance
                NoteImportance(
                  importanceController: importanceController,
                ),
                Gap(30.h),
                CustomButton(
                  color: blue,
                  onPressed: () => {
                    context.read<NotesBloc>().add(
                          InsertNoteEvent(
                            note: Note(
                                date: DateFormat('d MMMM').format(DateTime.now()),
                                description: descriptionController.text,
                                id: null,
                                noteStatus: importanceController.text.toLowerCase(),
                                time: DateFormat.Hm().format(DateTime.now()),
                                title: titleController.text),
                          ),
                        ),
                    Navigator.pop(context),
                  },
                  title: 'Confirm new note',
                ),
                Gap(10.h),
                CustomButton(
                  color: black,
                  onPressed: () => Navigator.pop(context),
                  title: 'Back',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
