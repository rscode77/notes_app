import 'package:sqflite/sqflite.dart';

import '../data/entities/note.dart';

abstract class NoteRepository {
  Future<void> insertNote(Database database, Note note);
  Future<List<Note>> getNotes(Database database);
  Future<void> editNote();
  Future<void> deleteNote();
  Future<Database> initDatabase();
}
