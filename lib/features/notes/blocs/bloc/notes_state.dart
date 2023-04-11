part of 'notes_bloc.dart';

class NotesState extends Equatable {
  const NotesState({
    required this.database,
    required this.selectedMenuTab,
    required this.notes,
  });

  final Database? database;
  final MenuTab selectedMenuTab;
  final List<Note> notes;

  @override
  List<Object?> get props => [selectedMenuTab, notes, database];

  NotesState copyWith({
    Database? database,
    MenuTab? selectedMenuTab,
    List<Note>? notes,
  }) {
    return NotesState(
      database: database ?? this.database,
      selectedMenuTab: selectedMenuTab ?? this.selectedMenuTab,
      notes: notes ?? this.notes,
    );
  }
}
