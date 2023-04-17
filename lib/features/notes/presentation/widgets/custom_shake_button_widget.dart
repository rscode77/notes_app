import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShakeButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final Color buttonColor;
  final Color iconColor;
  final IconData icon;

  const CustomShakeButtonWidget({
    Key? key,
    required this.onPressed,
    required this.buttonColor,
    required this.iconColor,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: buttonColor,
      ),
      height: 35.h,
      width: 35.w,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: onPressed,
        child: Icon(
          icon,
          size: 25,
          color: iconColor,
        ),
      ).animate(onPlay: (controller) => controller.repeat(period: const Duration(seconds: 5))).shake(),
    );
  }
}
