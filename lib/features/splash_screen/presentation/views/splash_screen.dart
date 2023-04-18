import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:notes_app/app_constants.dart';
import 'package:notes_app/features/notes/presentation/widgets/custom_button_widget.dart';
import 'package:notes_app/features/splash_screen/blocs/splash_screen/splash_screen_bloc.dart';
import 'package:notes_app/routes.dart';

import '../widgets/app_logo_widget.dart';
import '../widgets/notes_name_text_field_widget.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController notesNameController = TextEditingController();
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/note_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Column(
                              children: [
                                const AppLogoWidget(),
                                Gap(10.h),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Your all in one note-taking application.',
                                    style: Theme.of(context).textTheme.labelLarge,
                                  ),
                                ),
                                Gap(6.h),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Take notes, set reminders, and enjoy increased productivity with notes.',
                                    style: Theme.of(context).textTheme.labelMedium!.copyWith(color: grayText),
                                  ),
                                ),
                                Gap(30.h),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Name your notes',
                                    style: Theme.of(context).textTheme.labelLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(8.h),
                          BlocBuilder<SplashScreenBloc, SplashScreenState>(
                            builder: (context, state) {
                              if (state.noteName == null) {
                                return Column(
                                  children: [
                                    NotesNameTextFieldWidget(notesNameController: notesNameController),
                                    Gap(30.h),
                                    CustomButtonWidget(
                                      title: 'Open note',
                                      color: blue,
                                      onPressed: () => {
                                        if (notesNameController.text.isNotEmpty)
                                          {
                                            context.read<SplashScreenBloc>().add(SetNoteNameEvent(noteName: notesNameController.text)),
                                            Navigator.pushNamedAndRemoveUntil(context, notesView, (route) => false),
                                          }
                                      },
                                    ),
                                  ],
                                );
                              } else {
                                Navigator.pushNamedAndRemoveUntil(context, notesView, (route) => false);
                                return Container(
                                  height: 50.h,
                                  width: 50.w,
                                  child: CircularProgressIndicator(color: blue),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
