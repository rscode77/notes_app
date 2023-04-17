// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:notes_app/app_constants.dart';
import 'package:notes_app/features/notes/blocs/bloc/notes_bloc.dart';
import 'package:notes_app/features/notes/domain/data/entities/note.dart';
import 'package:notes_app/features/notes/presentation/widgets/circle_button_widget.dart';

class ResizedNoteView extends StatefulWidget {
  const ResizedNoteView({
    Key? key,
    required this.note,
  }) : super(key: key);
  final Note note;

  @override
  State<ResizedNoteView> createState() => _ResizedNoteViewState();
}

class _ResizedNoteViewState extends State<ResizedNoteView> {
  late String importance;

  @override
  void initState() {
    importance = widget.note.noteStatus;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 150,
      scrollable: true,
      backgroundColor: Colors.transparent,
      actions: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 1.5,
              ),
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: background,
              ),
              width: MediaQuery.of(context).size.width / 1.5,
              child: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Text(
                            widget.note.title,
                            style: widget.note.noteStatus == 'performed'
                                ? Theme.of(context).textTheme.labelLarge!.copyWith(decoration: TextDecoration.lineThrough, color: grayText)
                                : Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Text(
                            widget.note.time,
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(color: grayText),
                          ),
                        ),
                      ],
                    ),
                    Gap(20.h),
                    Text(
                      widget.note.description,
                      style: widget.note.noteStatus == 'performed'
                          ? Theme.of(context).textTheme.labelMedium!.copyWith(decoration: TextDecoration.lineThrough, color: grayText)
                          : Theme.of(context).textTheme.labelMedium,
                    ),
                    Gap(20.h),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        widget.note.date,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(color: grayText),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: black,
                ),
                height: 35.h,
                width: 35.w,
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () => {
                    context.read<NotesBloc>().add(DeleteNoteEvent(noteId: widget.note.id!)),
                    Navigator.pop(context),
                  },
                  child: const Icon(
                    Icons.delete_outline_rounded,
                    size: 25,
                    color: Colors.white,
                  ),
                ).animate(onPlay: (controller) => controller.repeat(period: const Duration(seconds: 5))).shake(),
              ),
            ),
            Visibility(
              visible: widget.note.noteStatus != 'performed',
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: blue,
                      ),
                      height: 35.h,
                      width: 35.w,
                      child: InkWell(
                        onTap: () => {
                          context.read<NotesBloc>().add(PerformNoteEvent(noteId: widget.note.id!)),
                          Navigator.pop(context),
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        child: const Icon(
                          Icons.done,
                          size: 25,
                          color: Colors.white,
                        ),
                      ).animate(onPlay: (controller) => controller.repeat(period: const Duration(seconds: 5))).shake(),
                    ),
                    Gap(8.h),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: black,
                      ),
                      height: 35.h,
                      width: 35.w,
                      child: InkWell(
                        onTap: () => {
                          setState(() {
                            importance = importance == 'standard' ? 'important' : 'standard';
                          }),
                          context.read<NotesBloc>().add(ChangeImportanceEvent(noteId: widget.note.id!, importance: importance)),
                        },
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        child: Icon(
                          importance == 'standard' ? Icons.star_border_rounded : Icons.star_rounded,
                          size: 30,
                          color: yellow,
                        ),
                      ).animate(onPlay: (controller) => controller.repeat(period: const Duration(seconds: 5))).shake(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: CircleButtonWidget(
              onPressed: () => Navigator.pop(context),
              icon: Icons.close,
              color: blue,
            ),
          ),
        ),
      ],
    );
  }
}
