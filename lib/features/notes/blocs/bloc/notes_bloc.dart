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
      var notes = await NoteRepositoryImpl().getNotes(state.database!);
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
      await NoteRepositoryImpl().insertNote(
        state.database!,
        const Note(
          date: '2023-04-13',
          description:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', id: null, noteStatus: 'standard', time: '12:15', title: 'Lorem ipsum",
          id: null,
          noteStatus: 'standard',
          time: '12:15',
          title: 'Lorem ipsum',
        ),
      );
    });
  }
}
