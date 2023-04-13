// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_constants.dart';

class NotesContainerWidget extends StatelessWidget {
  const NotesContainerWidget({
    Key? key,
    required this.notesTitle,
    required this.active,
    required this.notesQuantity,
    required this.onPressed,
  }) : super(key: key);

  final String notesTitle;
  final bool active;
  final int notesQuantity;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: active
              ? [
                  BoxShadow(
                    color: blue.withOpacity(0.25),
                    spreadRadius: 5,
                    blurRadius: 15,
                    offset: const Offset(0, 9), // changes position of shadow
                  ),
                ]
              : [],
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: active ? [lightBlue, blue] : [lightGray, gray],
            stops: const [0.0, 0.4],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        height: 180.h,
        width: 150.w,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 25.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                notesTitle,
                style: active
                    ? Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: Colors.white,
                        )
                    : Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: grayText,
                        ),
              ),
              Text(
                notesQuantity.toString(),
                style: active
                    ? Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: Colors.white,
                          fontSize: 30,
                        )
                    : Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: black,
                          fontSize: 30,
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
