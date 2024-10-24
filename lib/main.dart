import 'package:demo_app_flutter/controller/theme_controller.dart';
import 'package:demo_app_flutter/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  Get.put(ThemeController(), permanent: true);
  // For slower hero animation speed 1.0 means normal speed,
  // Increase number to slower in seconds.
  timeDilation = 5.0;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Obx(
      () {
        Color textColor = themeController.isDarkMode.value
            ? Color(0xFFFFFFFF)
            : Color(0xFF000000);
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Animated Scroll Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
              headlineLarge: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              headlineMedium: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              bodyLarge: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              bodyMedium: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              bodySmall: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          themeMode: themeController.themeMode.value,
          home: const SplashScreen(),
        );
      },
    );
  }
}
