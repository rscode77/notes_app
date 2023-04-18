import 'package:flutter/material.dart';
import 'package:notes_app/features/notes/presentation/views/add_note_view.dart';
import 'package:notes_app/features/splash_screen/presentation/views/splash_screen.dart';

import 'features/notes/presentation/views/notes_view.dart';

const String splashScreenView = '/';
const String notesView = '/notes';
const String addNoteView = '/addNote';
const String userView = '/userView';

Route<dynamic> controller(RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case userView:
      builder = (BuildContext context) => const SplashScreenView();
      break;
    case notesView:
      builder = (BuildContext context) => const NotesView();
      break;
    case addNoteView:
      builder = (BuildContext context) => const AddNoteView();
      break;
    case splashScreenView:
      builder = (BuildContext context) => const SplashScreenView();
      break;
    default:
      throw ('Route does not exist');
  }
  return MaterialPageRoute(builder: builder, settings: settings);
}
