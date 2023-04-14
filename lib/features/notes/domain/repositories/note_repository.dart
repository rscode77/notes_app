import 'package:sqflite/sqflite.dart';

import '../data/entities/note.dart';

abstract class NoteRepository {
  Future<void> insertNote({required Database database, required Note note});
  Future<List<Note>> getNotes({required Database database});
  Future<void> editNote();
  Future<void> deleteNote();
  Future<Database> initDatabase();
}
