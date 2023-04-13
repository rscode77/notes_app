import 'package:notes_app/features/notes/domain/data/entities/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../repositories/note_repository.dart';

class NoteRepositoryImpl extends NoteRepository {
  @override
  Future<void> deleteNote() {
    // TODO: implement DeleteNote
    throw UnimplementedError();
  }

  @override
  Future<void> editNote() {
    // TODO: implement EditNote
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> getNotes(Database database) async {
    final db = database;
    final List<Map<String, dynamic>> maps = await db.query('notes');

    return List.generate(maps.length, (i) {
      return Note(
        date: maps[i]['date'],
        description: maps[i]['description'],
        id: maps[i]['id'],
        time: maps[i]['time'],
        title: maps[i]['title'],
        noteStatus: maps[i]['noteStatus'],
      );
    });
  }

  @override
  Future<void> insertNote(Database database, Note note) async {
    final db = database;
    await db.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<Database> initDatabase() async {
    //await deleteDatabase('notes_app.db');
    final database = openDatabase(
      join(await getDatabasesPath(), 'notes_app.db'),
      onCreate: (db, version) {
        return db.execute('CREATE TABLE notes(id INTEGER PRIMARY KEY, date TEXT, description Text, time TEXT, title TEXT, noteStatus TEXT)');
      },
      version: 1,
    );
    return database;
  }
}
