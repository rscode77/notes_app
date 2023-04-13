import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../app_constants.dart';

class NoteDescription extends StatelessWidget {
  final TextEditingController descriptionController;

  const NoteDescription({
    Key? key,
    required this.descriptionController,
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
                  '2',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
            Gap(15.w),
            Text(
              'Enter description',
              style: Theme.of(context).textTheme.labelLarge,
            )
          ],
        ),
        Gap(10.h),
        Container(
          height: 150.h,
          margin: EdgeInsets.only(left: 10.w, right: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: gray,
          ),
          width: double.infinity,
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: descriptionController,
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'enter a description for the note...',
              hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: grayText),
            ),
          ),
        ),
      ],
    );
  }
}
