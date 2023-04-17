import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import 'package:notes_app/app_constants.dart';
import 'package:notes_app/features/notes/domain/data/entities/note.dart';
import 'package:notes_app/features/notes/presentation/widgets/note_importance_widget.dart';

import '../../blocs/bloc/notes_bloc.dart';
import '../widgets/circle_button_widget.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/note_description_widget.dart';
import '../widgets/note_title_widget.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final importanceController = TextEditingController();

    return Scaffold(
      backgroundColor: background,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 30.h,
            horizontal: 30.w,
          ),
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
              NoteTitleWidget(
                titleController: titleController,
              ),
              Gap(20.h),
              //Description
              NoteDescriptionWidget(
                descriptionController: descriptionController,
              ),
              Gap(20.h),
              //Importance
              NoteImportanceWidget(
                importanceController: importanceController,
              ),
              Gap(30.h),
              CustomButtonWidget(
                color: blue,
                onPressed: () => {
                  if (titleController.text.isNotEmpty && descriptionController.text.isNotEmpty)
                    addNewNote(
                      context: context,
                      title: titleController.text,
                      description: descriptionController.text,
                      importance: importanceController.text,
                    )
                },
                title: 'Confirm new note',
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: CircleButtonWidget(
                  onPressed: () => Navigator.pop(context),
                  icon: Icons.close,
                  color: black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addNewNote({
    required BuildContext context,
    required String title,
    required String description,
    required String importance,
  }) {
    context.read<NotesBloc>().add(
          InsertNoteEvent(
            note: Note(
                date: DateFormat('d MMMM').format(DateTime.now()),
                description: description,
                id: null,
                noteStatus: importance.toLowerCase(),
                time: DateFormat.Hm().format(DateTime.now()),
                title: title),
          ),
        );
    Navigator.pop(context);
  }
}
