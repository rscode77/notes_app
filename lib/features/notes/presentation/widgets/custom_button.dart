// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_constants.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function()? onPressed;
  const CustomButton({
    Key? key,
    required this.title,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(25)),
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
