// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../app_constants.dart';

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
          height: 160.h,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    time,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: grayText,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              Gap(20.h),
              Text(
                description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const Spacer(),
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
          height: 38.h,
          width: 38.w,
          child: const Icon(
            Icons.open_in_full_rounded,
            color: Colors.white,
            size: 21,
          ),
        ),
      ],
    );
  }
}
