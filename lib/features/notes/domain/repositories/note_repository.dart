import 'package:sqflite/sqflite.dart';

import '../data/entities/note.dart';

abstract class NoteRepository {
  Future<void> insertNote({required Database database, required Note note});
  Future<List<Note>> getNotes({required Database database});
  Future<void> performNote({required Database database, required int noteId});
  Future<void> deleteNote({required Database database, required int noteId});
  Future<void> changeImportance({required Database database, required int noteId, required String importance});
  Future<Database> initDatabase();
}
