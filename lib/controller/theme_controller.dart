import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromPreferences();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _updateThemeMode();
    _saveThemeToPreferences(isDarkMode.value);
  }

  Future<void> _loadThemeFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkModeSaved = prefs.getBool('isDarkMode') ?? false;
    isDarkMode.value = isDarkModeSaved;
    _updateThemeMode(); // Set the theme mode based on loaded preference
  }

  Future<void> _saveThemeToPreferences(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
  }

  void _updateThemeMode() {
    themeMode.value = isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
  }
}
