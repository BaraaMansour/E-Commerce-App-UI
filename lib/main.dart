import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_application_1/utils/app_themes.dart';
import 'package:flutter_application_1/view/splash_screen.dart';
import 'package:flutter_application_1/controllers/theme_controller.dart';

Future<void> main() async {
  await GetStorage.init();
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return MaterialApp(
      title: 'Fashion Store',
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: themeController.theme,
      home: const SplashScreen(),
    );
  }
}
