import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../app_constants.dart';
import 'circle_button_widget.dart';

class InformationWidget extends StatelessWidget {
  const InformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      elevation: 100,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      actions: [
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: background,
            ),
            width: MediaQuery.of(context).size.width / 1.5,
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.info_outline_rounded,
                      size: 25,
                    ),
                    Gap(15.w),
                    Text(
                      'Informations',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                Gap(22.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  width: 230.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.arrow_circle_right_outlined, size: 18),
                      Gap(5.w),
                      Flexible(
                        child: Text(
                          'Swipe note to the right to mark it as performed.',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  width: 230.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.arrow_circle_left_outlined, size: 18),
                      Gap(5.w),
                      Flexible(
                        child: Text(
                          'Swipe note left to remove.',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  width: 230.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 3.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: blue,
                          ),
                          height: 16.h,
                          width: 16.w,
                          child: const Icon(
                            Icons.add,
                            size: 11,
                            color: Colors.white,
                          )),
                      Gap(5.w),
                      Flexible(
                        child: Text(
                          'Tap plus icon to add new note.',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  width: 230.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 3.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: blue,
                          ),
                          height: 16.h,
                          width: 16.w,
                          child: const Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 11,
                            color: Colors.white,
                          )),
                      Gap(5.w),
                      Flexible(
                        child: Text(
                          'Tap right arrow to resize note.',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  width: 230.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 3.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: black,
                          ),
                          height: 16.h,
                          width: 16.w,
                          child: const Icon(
                            Icons.star_rounded,
                            size: 11,
                            color: Colors.yellow,
                          )),
                      Gap(5.w),
                      Flexible(
                        child: Text(
                          'Tap star to change note importance.',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  width: 230.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: black,
                          ),
                          height: 16.h,
                          width: 16.w,
                          child: const Icon(
                            Icons.delete_outline_rounded,
                            size: 11,
                            color: Colors.white,
                          )),
                      Gap(5.w),
                      Flexible(
                        child: Text(
                          'Tap trash to delete note.',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  width: 230.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 3.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: blue,
                          ),
                          height: 16.h,
                          width: 16.w,
                          child: const Icon(
                            Icons.save_outlined,
                            size: 11,
                            color: Colors.white,
                          )),
                      Gap(5.w),
                      Flexible(
                        child: Text(
                          'Tap to update note description.',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(10.h),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: CircleButtonWidget(
              onPressed: () => Navigator.pop(context),
              icon: Icons.close,
              color: blue,
            ),
          ),
        ),
      ],
    );
  }
}
