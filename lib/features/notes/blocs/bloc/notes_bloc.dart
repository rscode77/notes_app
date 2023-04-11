import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_app/enums.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(const NotesState(selectedMenuTab: MenuTab.notes)) {
    on<ChangeMenuTab>((event, emit) {
      emit(state.copyWith(selectedMenuTab: event.menuTab));
    });
  }
}
