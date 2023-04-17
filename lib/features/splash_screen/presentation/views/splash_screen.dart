import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:notes_app/app_constants.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height);
    // print(MediaQuery.of(context).size.width);
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 40.h,
        ),
        child: Column(
          children: [],
        ),
      )),
    );
  }
}
