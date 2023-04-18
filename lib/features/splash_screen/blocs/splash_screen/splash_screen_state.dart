part of 'splash_screen_bloc.dart';

class SplashScreenState extends Equatable {
  final String? noteName;

  const SplashScreenState({
    required this.noteName,
  });

  @override
  List<Object?> get props => [noteName];

  SplashScreenState copyWith({
    String? noteName,
    bool? firstRun,
  }) {
    return SplashScreenState(
      noteName: noteName ?? this.noteName,
    );
  }
}
