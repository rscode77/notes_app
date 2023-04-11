import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/features/notes/blocs/bloc/notes_bloc.dart';
import 'package:notes_app/features/user/blocs/bloc/user_bloc.dart';

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
      designSize: const Size(392.72727272727275, 781.0909090909091),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (BuildContext context) => UserBloc(),
            ),
            BlocProvider(
              create: (BuildContext context) => NotesBloc()..add(InitDatabaseEvent()),
            ),
          ],
          child: MaterialApp(
            title: 'NotesApp',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: TextTheme(
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
