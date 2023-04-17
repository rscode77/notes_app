abstract class SplashScreenRepository {
  Future<void> setNoteName({required String noteName});
  Future<void> getNoteName();
  Future<void> setFirstRunSetting();
}
