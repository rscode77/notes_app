import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/features/notes/blocs/bloc/notes_bloc.dart';
import 'package:notes_app/features/splash_screen/blocs/splash_screen/splash_screen_bloc.dart';

import 'app_constants.dart';
import 'routes.dart' as route;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72727272727275, 759.2727272727273),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (BuildContext context) => NotesBloc()..add(InitDatabaseEvent()),
            ),
            BlocProvider(
              create: (BuildContext context) => SplashScreenBloc(),
            ),
          ],
          child: MaterialApp(
            title: 'NotesApp',
            theme: ThemeData(
              textTheme: TextTheme(
                titleLarge: GoogleFonts.lato(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: black,
                ),
                titleSmall: GoogleFonts.lato(
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: black,
                ),
                headlineLarge: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: black,
                ),
                headlineMedium: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
                headlineSmall: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: black,
                ),
                labelLarge: GoogleFonts.lato(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: black,
                ),
                labelMedium: GoogleFonts.lato(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: black,
                ),
                labelSmall: GoogleFonts.roboto(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: black,
                ),
              ),
            ),
            initialRoute: route.notesView,
            onGenerateRoute: route.controller,
          ),
        );
      },
    );
  }
}
