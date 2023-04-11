import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:notes_app/app_constants.dart';

import '../../../../enums.dart';

class MenuItemWidget extends StatelessWidget {
  final String title;
  final bool active;
  final Function()? onPressed;
  const MenuItemWidget({
    Key? key,
    required this.title,
    required this.active,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: active
                ? Theme.of(context).textTheme.headlineSmall
                : Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: grayText,
                    ),
          ),
          Gap(9.h),
          Visibility(
            visible: active,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: blue,
                  ),
                  width: 28.w,
                  height: 3.h,
                ),
                Gap(4.w),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: blue,
                  ),
                  width: 3.w,
                  height: 3.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
