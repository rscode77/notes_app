import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../app_constants.dart';

class NoteDescriptionWidget extends StatefulWidget {
  final TextEditingController descriptionController;

  const NoteDescriptionWidget({
    Key? key,
    required this.descriptionController,
  }) : super(key: key);

  @override
  State<NoteDescriptionWidget> createState() => _NoteDescriptionWidgetState();
}

class _NoteDescriptionWidgetState extends State<NoteDescriptionWidget> {
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
                color: widget.descriptionController.text.isEmpty ? Colors.red : blue,
              ),
              child: Center(
                child: Text(
                  '2',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ).animate(onPlay: (controller) => controller.repeat(period: const Duration(seconds: 5))).shake(),
            Gap(15.w),
            Text(
              'Enter description',
              style: Theme.of(context).textTheme.labelLarge,
            )
          ],
        ),
        Gap(10.h),
        Container(
          height: 120.h,
          margin: EdgeInsets.only(left: 10.w, right: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: gray,
          ),
          width: double.infinity,
          child: TextField(
            onChanged: (value) => setState(() {}),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: widget.descriptionController,
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
