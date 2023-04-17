import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:notes_app/app_constants.dart';
import 'package:notes_app/features/notes/blocs/bloc/notes_bloc.dart';
import 'package:notes_app/features/notes/domain/data/entities/note.dart';
import 'package:notes_app/features/notes/presentation/widgets/circle_button_widget.dart';

import '../widgets/custom_shake_button_widget.dart';

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
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    importance = widget.note.noteStatus;
    descriptionController.text = widget.note.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      elevation: 100,
      scrollable: true,
      backgroundColor: Colors.transparent,
      content: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 1.5,
                ),
                margin: EdgeInsets.symmetric(horizontal: 18.w),
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: background,
                ),
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
                      //Description
                      TextField(
                        readOnly: widget.note.noteStatus == 'performed',
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        maxLines: null,
                        controller: descriptionController,
                        style: widget.note.noteStatus == 'performed'
                            ? Theme.of(context).textTheme.labelMedium!.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  color: grayText,
                                )
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
              //Left icons
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Visibility(
                      visible: widget.note.noteStatus != 'performed',
                      child: CustomShakeButtonWidget(
                        buttonColor: blue,
                        icon: Icons.save_outlined,
                        iconColor: Colors.white,
                        onPressed: () {
                          context.read<NotesBloc>().add(
                                UpdateDescriptionEvent(
                                  noteId: widget.note.id!,
                                  description: descriptionController.text,
                                ),
                              );
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Gap(8.h),
                    CustomShakeButtonWidget(
                      buttonColor: black,
                      icon: Icons.delete_outline_rounded,
                      iconColor: Colors.white,
                      onPressed: () {
                        context.read<NotesBloc>().add(DeleteNoteEvent(noteId: widget.note.id!));
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              //Right icons
              Visibility(
                visible: widget.note.noteStatus != 'performed',
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      CustomShakeButtonWidget(
                        buttonColor: blue,
                        icon: Icons.done,
                        iconColor: Colors.white,
                        onPressed: () {
                          context.read<NotesBloc>().add(PerformNoteEvent(noteId: widget.note.id!));
                          Navigator.pop(context);
                        },
                      ),
                      Gap(8.h),
                      CustomShakeButtonWidget(
                        buttonColor: black,
                        icon: importance == 'standard' ? Icons.star_border_rounded : Icons.star_rounded,
                        iconColor: yellow,
                        onPressed: () {
                          setState(() {
                            importance = importance == 'standard' ? 'important' : 'standard';
                          });
                          context.read<NotesBloc>().add(UpdateImportanceEvent(noteId: widget.note.id!, importance: importance));
                        },
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
      ),
    );
  }
}
