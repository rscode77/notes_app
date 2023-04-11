import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bloc/notes_bloc.dart';
import 'notes_category_container_widget.dart';

class NotesCategoryWidget extends StatelessWidget {
  const NotesCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NotesCategoryContainerWidget(
              notesTitle: 'Notes',
              active: true,
              notesQuantity: state.notes.where((element) => element.noteStatus == 'standard').toList().length,
            ),
            NotesCategoryContainerWidget(
              notesTitle: 'Important',
              active: false,
              notesQuantity: state.notes.where((element) => element.noteStatus == 'important').toList().length,
            ),
          ],
        );
      },
    );
  }
}
