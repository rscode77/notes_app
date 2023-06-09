import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final Color color;
  final Function()? onPressed;
  const CustomButtonWidget({
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),
        ),
      ),
    )
        .animate(onPlay: (controller) => controller.repeat(reverse: true, period: const Duration(milliseconds: 5000)))
        .shimmer(color: Colors.white24, delay: const Duration(milliseconds: 3000));
  }
}
