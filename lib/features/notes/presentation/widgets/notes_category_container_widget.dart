import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_constants.dart';

class NotesCategoryContainerWidget extends StatelessWidget {
  const NotesCategoryContainerWidget({
    Key? key,
    required this.notesTitle,
    required this.active,
    required this.notesQuantity,
  }) : super(key: key);

  final String notesTitle;
  final bool active;
  final int notesQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      height: 200.h,
      width: MediaQuery.of(context).size.width / 2.5,
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
                  ? Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white)
                  : Theme.of(context).textTheme.headlineLarge!.copyWith(color: grayText),
            ),
            Text(
              notesQuantity.toString(),
              style: active
                  ? Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white)
                  : Theme.of(context).textTheme.headlineLarge!.copyWith(color: black),
            ),
          ],
        ),
      ),
    );
  }
}
