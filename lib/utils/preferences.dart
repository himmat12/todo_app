import 'package:get_storage/get_storage.dart';

final prefs = GetStorage('prefs');

class Preferences {
  static setThemeDate(bool data) => prefs.write('theme', data);

  static bool? get themeDate => prefs.read('theme');

  static erasePrefs() => prefs.erase();
}
