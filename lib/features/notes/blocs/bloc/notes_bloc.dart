import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_app/enums.dart';
import 'package:notes_app/features/notes/domain/data/repositories/note_repository_impl.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/data/entities/note.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(const NotesState(selectedMenuTab: MenuTab.notes, notes: [], database: null)) {
    on<ChangeMenuTabEvent>((event, emit) {
      emit(state.copyWith(selectedMenuTab: event.menuTab));
    });
    on<GetNotesEvent>((event, emit) async {
      var notes = await NoteRepositoryImpl().getNotes(database: state.database!);
      if (notes.isEmpty) {
        return;
      }
      emit(state.copyWith(notes: notes));
    });
    on<InitDatabaseEvent>((event, emit) async {
      var database = await NoteRepositoryImpl().initDatabase();
      emit(state.copyWith(database: database));
      add(GetNotesEvent());
    });
    on<InsertNoteEvent>((event, emit) async {
      await NoteRepositoryImpl().insertNote(database: state.database!, note: event.note);
      add(GetNotesEvent());
      print(event.note.noteStatus);
    });
  }
}
