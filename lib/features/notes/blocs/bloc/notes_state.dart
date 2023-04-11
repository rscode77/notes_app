part of 'notes_bloc.dart';

class NotesState extends Equatable {
  const NotesState({
    required this.selectedMenuTab,
  });

  final MenuTab selectedMenuTab;

  @override
  List<Object> get props => [selectedMenuTab];

  NotesState copyWith({
    MenuTab? selectedMenuTab,
  }) {
    return NotesState(
      selectedMenuTab: selectedMenuTab ?? this.selectedMenuTab,
    );
  }
}
