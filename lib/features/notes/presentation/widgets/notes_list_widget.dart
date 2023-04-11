import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return SizedBox(
      height: 392.h,
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
    );
  }
}
