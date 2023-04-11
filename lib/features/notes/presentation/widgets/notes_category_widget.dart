import 'package:flutter/material.dart';
import 'package:notes_app/features/notes/presentation/widgets/notes_category_container_widget.dart';

import '../../../../app_constants.dart';

class NotesCategoryWidget extends StatelessWidget {
  const NotesCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        NotesCategoryContainerWidget(
          notesTitle: 'Notes',
          active: true,
          notesQuantity: 125,
        ),
        NotesCategoryContainerWidget(
          notesTitle: 'Important',
          active: false,
          notesQuantity: 125,
        ),
      ],
    );
  }
}
