// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notes_bloc.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object> get props => [];
}

class ChangeMenuTab extends NotesEvent {
  final MenuTab menuTab;

  const ChangeMenuTab({
    required this.menuTab,
  });

  @override
  List<Object> get props => [menuTab];
}
