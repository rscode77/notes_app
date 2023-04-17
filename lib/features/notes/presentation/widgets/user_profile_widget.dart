import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../app_constants.dart';

class UserProfileWidget extends StatelessWidget {
  final String name;

  const UserProfileWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            color: profileIconBackground,
            borderRadius: BorderRadius.circular(18),
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
