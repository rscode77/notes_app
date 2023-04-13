import 'package:flutter/material.dart';
import 'package:notes_app/features/notes/presentation/views/add_note_view.dart';
import 'package:notes_app/features/user/presentation/views/user_view.dart';

import 'features/notes/presentation/views/notes_view.dart';

const String userView = '/';
const String notesView = '/notes';
const String addNoteView = '/addNote';

Route<dynamic> controller(RouteSettings settings) {
  WidgetBuilder builder;
  switch (settings.name) {
    case userView:
      builder = (BuildContext context) => const UserView();
      break;
    case notesView:
      builder = (BuildContext context) => const NotesView();
      break;
    case addNoteView:
      builder = (BuildContext context) => const AddNoteView();
      break;
    default:
      throw ('Route does not exist');
  }
  return MaterialPageRoute(builder: builder, settings: settings);
}
