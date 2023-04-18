import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class UserProfileWidget extends StatelessWidget {
  final String name;
  final Image image;

  const UserProfileWidget({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Gap(20.w),
        Text(
          name,
          style: Theme.of(context).textTheme.headlineLarge,
        )
      ],
    );
  }
}
