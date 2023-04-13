import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../app_constants.dart';

class NoteTitle extends StatelessWidget {
  final TextEditingController titleController;

  const NoteTitle({
    Key? key,
    required this.titleController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 25.h,
              width: 25.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: blue,
              ),
              child: Center(
                child: Text(
                  '1',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
            Gap(15.w),
            Text(
              'Enter title',
              style: Theme.of(context).textTheme.labelLarge,
            )
          ],
        ),
        Gap(10.h),
        Container(
          margin: EdgeInsets.only(left: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: gray,
          ),
          height: 50.h,
          width: double.infinity,
          child: TextField(
            controller: titleController,
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              hintText: 'throw out rubbish...',
              hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: grayText),
            ),
          ),
        ),
      ],
    );
  }
}
