import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_app/features/splash_screen/domain/data/repositories/splash_screen_repository_impl.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(const SplashScreenState(noteName: null)) {
    on<GetNoteNameEvent>((event, emit) {
      SplashScreenRepositoryImpl().getNoteName();
    });
    on<SetNoteNameEvent>((event, emit) {
      SplashScreenRepositoryImpl().setNoteName(noteName: event.noteName);
      state.copyWith(noteName: event.noteName);
    });
  }
}
