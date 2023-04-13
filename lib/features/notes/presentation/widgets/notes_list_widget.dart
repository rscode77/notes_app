import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:notes_app/features/notes/presentation/widgets/circle_button.dart';
import 'package:notes_app/routes.dart';

import '../../domain/data/entities/note.dart';
import 'note_widget.dart';

class NotesListWidget extends StatelessWidget {
  const NotesListWidget({
    super.key,
    required this.notes,
  });

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.w),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                  child: NoteWidget(
                      title: notes[index].title,
                      description: notes[index].description,
                      time: notes[index].time,
                      date: notes[index].date,
                      id: notes[index].id as int,
                      noteStatus: notes[index].noteStatus),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Gap(5.h),
                  CircleButton(
                    icon: Icons.add,
                    onPressed: () => Navigator.pushNamed(context, addNoteView),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
