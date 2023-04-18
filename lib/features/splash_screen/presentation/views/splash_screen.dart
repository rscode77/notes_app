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

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  final TextEditingController notesNameController = TextEditingController();

  late Image bgImage;
  late Image logoImage;

  @override
  void initState() {
    bgImage = Image.asset("assets/images/note_bg.png");
    logoImage = Image.asset("assets/images/note_image.png");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(bgImage.image, context);
    precacheImage(logoImage.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: bgImage.image,
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
                      margin: EdgeInsets.symmetric(horizontal: 50.w, vertical: 40.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              AppLogoWidget(logoImage: logoImage),
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
                              Gap(15.h),
                            ],
                          ),
                          Gap(8.h),
                          BlocConsumer<SplashScreenBloc, SplashScreenState>(
                            listener: (context, state) {
                              if (state.noteName.isNotEmpty) {
                                Navigator.pushNamedAndRemoveUntil(context, notesView, (route) => false);
                              }
                            },
                            builder: (context, state) {
                              if (state.noteName.isEmpty && state.loading == false) {
                                return Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Name your notes',
                                        style: Theme.of(context).textTheme.labelLarge,
                                      ),
                                    ),
                                    Gap(10.h),
                                    NotesNameTextFieldWidget(notesNameController: notesNameController),
                                    Gap(30.h),
                                    CustomButtonWidget(
                                      title: 'Open note',
                                      color: blue,
                                      onPressed: () => {
                                        if (notesNameController.text.isNotEmpty)
                                          {
                                            context.read<SplashScreenBloc>().add(SetNoteNameEvent(noteName: notesNameController.text)),
                                          }
                                      },
                                    ),
                                  ],
                                );
                              }
                              return Column(
                                children: [
                                  Gap(58.h),
                                  SizedBox(
                                    height: 50.h,
                                    width: 50.w,
                                    child: const CircularProgressIndicator(color: blue),
                                  ),
                                  Gap(50.h),
                                ],
                              );
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
