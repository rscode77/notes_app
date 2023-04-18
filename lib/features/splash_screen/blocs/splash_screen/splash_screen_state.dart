part of 'splash_screen_bloc.dart';

class SplashScreenState extends Equatable {
  final String noteName;
  final bool loading;

  const SplashScreenState({
    required this.noteName,
    required this.loading,
  });

  @override
  List<Object> get props => [noteName];

  SplashScreenState copyWith({
    String? noteName,
    bool? loading,
  }) {
    return SplashScreenState(
      noteName: noteName ?? this.noteName,
      loading: loading ?? this.loading,
    );
  }
}
