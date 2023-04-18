// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'splash_screen_bloc.dart';

abstract class SplashScreenEvent extends Equatable {
  const SplashScreenEvent();

  @override
  List<Object> get props => [];
}

class SetNoteNameEvent extends SplashScreenEvent {
  final String noteName;

  const SetNoteNameEvent({
    required this.noteName,
  });

  @override
  List<Object> get props => [noteName];
}

class GetNoteNameEvent extends SplashScreenEvent {}
