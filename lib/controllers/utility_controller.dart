import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo_app/global_components/get_snackbar.dart';
import 'package:simple_todo_app/utils/box.dart';
import 'package:simple_todo_app/utils/preferences.dart';

class UtilityController extends GetxController {
  // bottom nav bar navigation state
  var _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;

  setIndex(int newIndex) {
    _currentIndex.value = newIndex;
  }

  // dark|light mode state
  var _isDark = false.obs;

  bool get isDark => _isDark.value;

  toggleTheme() {
    _isDark.value = !_isDark.value;
    Preferences.setThemeDate(_isDark.value);

    if (_isDark.value == false) {
      Get.changeTheme(ThemeData.light());
      getSnackbar(
        message: 'light theme enabled',
        leadingIcon: Icons.light_mode_outlined,
      );
    } else {
      Get.changeTheme(ThemeData.dark());
      getSnackbar(
        message: 'dark theme enabled',
        bgColor: Colors.grey.shade700,
        leadingIcon: Icons.dark_mode_outlined,
      );
    }
  }

  getThemeMode() {
    _isDark.value = Preferences.themeDate ?? false;

    if (_isDark.value == false) {
      Get.changeTheme(ThemeData.light());
    } else {
      Get.changeTheme(ThemeData.dark());
    }
  }

  resetTheme() {
    _isDark.value = false;
    Preferences.erasePrefs();
  }
}
