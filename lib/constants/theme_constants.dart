import 'package:demo_app_flutter/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeConstants {
  static ThemeController themeController = Get.find();
  static RxBool themeMode = themeController.isDarkMode;

  static Color get colorScheme => themeMode.value ? Colors.black : Colors.white;
  static Color? get infoBackgroundColorScheme =>
      themeMode.value ? Colors.grey[800] : Colors.grey[200];
  static Color get invertedColorScheme =>
      themeMode.value ? Colors.white : Colors.black;
  static Color get topLeftShadowColor =>
      themeMode.value ? Colors.grey.shade900 : Colors.grey.shade300;
  static Color get bottomRightShadowColor =>
      themeMode.value ? Colors.grey.shade800 : Colors.grey.shade300;
  static Icon get iconColor =>
      Icon(themeMode.value ? Icons.light_mode : Icons.dark_mode);
}
