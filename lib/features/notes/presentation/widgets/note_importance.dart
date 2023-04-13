import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../app_constants.dart';

class NoteImportance extends StatefulWidget {
  final TextEditingController importanceController;

  const NoteImportance({
    Key? key,
    required this.importanceController,
  }) : super(key: key);

  @override
  State<NoteImportance> createState() => _NoteImportanceState();
}

class _NoteImportanceState extends State<NoteImportance> {
  String importance = 'Normal';
  final List<String> importanceValues = ['Normal', 'Important'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 25.h,
              width: 25.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: blue,
              ),
              child: Center(
                child: Text(
                  '3',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
            Gap(15.w),
            Text(
              'Set note importance',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        Gap(10.h),
        Container(
          margin: EdgeInsets.only(left: 10.w, right: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: gray,
          ),
          width: double.infinity,
          height: 50.h,
          child: DropdownButton<String>(
            isExpanded: true,
            value: importance,
            icon: const Icon(
              Icons.arrow_drop_down_rounded,
              color: black,
            ),
            style: Theme.of(context).textTheme.labelLarge,
            underline: Container(),
            onChanged: (String? value) {
              setState(() {
                importance = value!;
              });
            },
            items: importanceValues.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
