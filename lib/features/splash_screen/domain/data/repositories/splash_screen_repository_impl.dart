import 'package:notes_app/features/splash_screen/repositories/splash_screen_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenRepositoryImpl extends SplashScreenRepository {
  @override
  Future<void> setNoteName({required String noteName}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('noteName', noteName);
  }

  @override
  Future<String?> getNoteName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? noteName = prefs.getString('noteName');
    return noteName;
  }
}
