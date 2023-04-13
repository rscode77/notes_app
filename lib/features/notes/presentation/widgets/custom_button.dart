import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(18)),
          backgroundColor: blue,
        ),
        onPressed: () => Navigator.pop(context),
        child: Text(
          'Confirm new note',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
