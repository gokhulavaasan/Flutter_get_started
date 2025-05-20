import 'package:flutter/material.dart';
import 'package:my_app_1/views/data/constants.dart';
import 'package:my_app_1/views/data/notifiers.dart';
import 'package:my_app_1/views/pages/settings_page.dart';
import 'package:my_app_1/views/widgets/navbar_widget.dart';
import 'package:my_app_1/views/pages/home_page.dart';
import 'package:my_app_1/views/pages/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = [const HomePage(), const ProfilePage()];

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
        actions: [
          IconButton(
            onPressed: () async {
              selectedTheme.value = !(selectedTheme.value);
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setBool(KConstatns.themeModeKey, selectedTheme.value);
            },
            icon: ValueListenableBuilder(
                valueListenable: selectedTheme,
                builder: (BuildContext context, dynamic theme, child) {
                  return Icon(
                      theme == true ? Icons.dark_mode : Icons.light_mode);
                }),
          ),

          // ValueListenableBuilder(
          //   valueListenable: selectedTheme,
          //   builder: (BuildContext context, dynamic theme, Widget? child) {
          //     return IconButton(
          //       onPressed: () async {
          //         final SharedPreferences prefs = await SharedPreferences.getInstance();
          //         await prefs.setBool(KConstatns.themeModeKey, value)
          //         selectedTheme.value = !(selectedTheme.value);
          //       },
          //       icon: Icon(theme == true ? Icons.dark_mode : Icons.light_mode),
          //     );
          //   },
          // ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SettingsPage();
              }));
            },
          ),
        ],
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (BuildContext context, dynamic selectedPage, Widget? child) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}
