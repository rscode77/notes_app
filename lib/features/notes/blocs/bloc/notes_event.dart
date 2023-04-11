// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notes_bloc.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object> get props => [];
}

class ChangeMenuTabEvent extends NotesEvent {
  final MenuTab menuTab;

  const ChangeMenuTabEvent({
    required this.menuTab,
  });

  @override
  List<Object> get props => [menuTab];
}

class InsertNoteEvent extends NotesEvent {
  final Note note;

  const InsertNoteEvent({
    required this.note,
  });

  @override
  List<Object> get props => [note];
}

class DeleteNoteEvent extends NotesEvent {
  final int noteId;

  const DeleteNoteEvent({
    required this.noteId,
  });

  @override
  List<Object> get props => [noteId];
}

class EditNoteEvent extends NotesEvent {
  final Note note;

  const EditNoteEvent({
    required this.note,
  });

  @override
  List<Object> get props => [note];
}

class InitDatabaseEvent extends NotesEvent {}

class GetNotesEvent extends NotesEvent {}
