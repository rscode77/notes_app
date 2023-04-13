import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:notes_app/app_constants.dart';

import '../widgets/note_description.dart';
import '../widgets/note_title.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 40.w,
            vertical: 40.h,
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
                      'Important',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                Gap(40.h),
                //Title
                NoteTitle(
                  titleController: titleController,
                ),
                Gap(20.h),
                //Description
                NoteDescription(
                  descriptionController: descriptionController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
