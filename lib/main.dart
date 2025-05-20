import 'package:flutter/material.dart';
import 'package:my_app_1/views/data/constants.dart';
import 'package:my_app_1/views/data/notifiers.dart';
import 'package:my_app_1/views/pages/welcome_page.dart';
import 'package:my_app_1/views/widget_tree.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initThemeMode();
  }

  void initThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isThemeMode = prefs.getBool(KConstatns.themeModeKey);
    selectedTheme.value = isThemeMode ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedTheme,
      builder: (BuildContext context, dynamic value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: value == true ? Brightness.light : Brightness.dark,
            ),
          ),
          home: const WelcomePage(),
        );
      },
    );
  }
}

@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.teal,
        brightness: Brightness.dark,
      ),
    ),
    home: const WidgetTree(),
  );
}
