import 'package:sqflite/sqflite.dart';

import '../data/entities/note.dart';

abstract class NoteRepository {
  Future<void> insertNote({required Database database, required Note note});
  Future<List<Note>> getNotes({required Database database});
  Future<void> performNote({required Database database, required int noteId});
  Future<void> deleteNote({required Database database, required int noteId});
  Future<void> updateImportance({required Database database, required int noteId, required String importance});
  Future<void> updateDescription({required Database database, required int noteId, required String description});
  Future<Database> initDatabase();
}
