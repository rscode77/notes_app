import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../app_constants.dart';

class NoteTitleWidget extends StatefulWidget {
  final TextEditingController titleController;

  const NoteTitleWidget({
    Key? key,
    required this.titleController,
  }) : super(key: key);

  @override
  State<NoteTitleWidget> createState() => _NoteTitleWidgetState();
}

class _NoteTitleWidgetState extends State<NoteTitleWidget> {
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
                color: widget.titleController.text.isEmpty ? Colors.red : blue,
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
          margin: EdgeInsets.only(left: 10.w, right: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: gray,
          ),
          height: 50.h,
          width: double.infinity,
          child: TextField(
            onChanged: (value) => setState(() {}),
            controller: widget.titleController,
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
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
