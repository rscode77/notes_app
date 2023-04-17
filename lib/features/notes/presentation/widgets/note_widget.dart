import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:notes_app/features/notes/presentation/views/resized_note_view.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../app_constants.dart';
import '../../domain/data/entities/note.dart';

class NoteWidget extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final String date;
  final int id;
  final String noteStatus;

  const NoteWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.time,
    required this.date,
    required this.id,
    required this.noteStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          padding: EdgeInsets.only(
            left: 25.w,
            right: 25.w,
            top: 15.h,
            bottom: 15.h,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: gray,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 4,
                    child: Text(
                      title,
                      style: noteStatus == 'performed'
                          ? Theme.of(context).textTheme.labelLarge!.copyWith(decoration: TextDecoration.lineThrough, color: grayText)
                          : Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      time,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: grayText,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
              Gap(15.h),
              Text(
                description,
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
                style: noteStatus == 'performed'
                    ? Theme.of(context).textTheme.labelMedium!.copyWith(decoration: TextDecoration.lineThrough, color: grayText)
                    : Theme.of(context).textTheme.labelMedium,
              ),
              Gap(15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    date,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: grayText,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: blue,
            borderRadius: BorderRadius.circular(12),
          ),
          height: 35.h,
          width: 35.w,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () => showDialog(
              context: context,
              builder: (context) => ResizedNoteView(
                note: Note(
                  date: date,
                  description: description,
                  id: id,
                  noteStatus: noteStatus,
                  time: time,
                  title: title,
                ),
              ),
            ),
            child: const Icon(
              Icons.arrow_circle_right_outlined,
              color: Colors.white,
              size: 25,
            ),
          ),
        ).animate(onPlay: (controller) => controller.repeat(period: const Duration(seconds: 5))).shake(),
      ],
    );
  }
}
