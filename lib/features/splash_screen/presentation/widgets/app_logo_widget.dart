import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        'assets/images/note_image.png',
      )
          .animate(onPlay: (controller) => controller.repeat(reverse: true, period: const Duration(milliseconds: 5000)))
          .shimmer(color: Colors.white24, delay: const Duration(milliseconds: 3000)),
    );
  }
}
