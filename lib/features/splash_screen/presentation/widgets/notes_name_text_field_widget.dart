import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_constants.dart';

class NotesNameTextFieldWidget extends StatelessWidget {
  const NotesNameTextFieldWidget({
    super.key,
    required this.notesNameController,
  });

  final TextEditingController notesNameController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      padding: EdgeInsets.only(left: 15.w),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: grayText.withOpacity(0.3)),
        color: gray,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        style: Theme.of(context).textTheme.labelMedium,
        controller: notesNameController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Set notes name',
          hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(color: grayText),
        ),
      ),
    );
  }
}
