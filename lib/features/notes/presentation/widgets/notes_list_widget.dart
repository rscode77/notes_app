import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/app_constants.dart';
import 'package:notes_app/features/notes/blocs/bloc/notes_bloc.dart';

import 'package:notes_app/features/notes/presentation/widgets/circle_button_widget.dart';
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
          ListView.builder(
            shrinkWrap: true,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 8.h),
                child: Dismissible(
                  direction: notes[index].noteStatus != 'performed' ? DismissDirection.horizontal : DismissDirection.none,
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      context.read<NotesBloc>().add(PerformNoteEvent(noteId: notes[index].id!));
                    } else {
                      context.read<NotesBloc>().add(DeleteNoteEvent(noteId: notes[index].id!));
                    }
                  },
                  key: Key(notes[index].id.toString()),
                  child: IntrinsicHeight(
                    child: NoteWidget(
                        title: notes[index].title,
                        description: notes[index].description,
                        time: notes[index].time,
                        date: notes[index].date,
                        id: notes[index].id as int,
                        noteStatus: notes[index].noteStatus),
                  ),
                ),
              );
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: CircleButtonWidget(
                icon: Icons.add,
                onPressed: () => Navigator.pushNamed(context, addNoteView),
                color: blue,
              ),
            ),
          ).animate(onPlay: (controller) => controller.repeat(reverse: true, period: const Duration(milliseconds: 4000))).shimmer(),
        ],
      ),
    );
  }
}
