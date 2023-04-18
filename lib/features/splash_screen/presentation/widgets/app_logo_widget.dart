import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppLogoWidget extends StatelessWidget {
  final Image logoImage;

  const AppLogoWidget({
    Key? key,
    required this.logoImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: logoImage
          .animate(onPlay: (controller) => controller.repeat(reverse: true, period: const Duration(milliseconds: 5000)))
          .shimmer(color: Colors.white24, delay: const Duration(milliseconds: 3000)),
    );
  }
}
