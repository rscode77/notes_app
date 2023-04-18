import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final IconData icon;
  final Color color;

  const CircleButtonWidget({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 60.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: color,
        ),
        child: Icon(icon),
      ),
    )
        .animate(onPlay: (controller) => controller.repeat(reverse: true, period: const Duration(milliseconds: 5000)))
        .shimmer(color: Colors.white24, delay: const Duration(milliseconds: 3000));
  }
}
