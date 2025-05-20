import 'package:flutter/material.dart';
import 'package:my_app_1/views/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (BuildContext context, dynamic selectedPage, Widget? child) {
        return NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'profile',
            )
          ],
          onDestinationSelected: (selectedPage) {
            selectedPageNotifier.value = selectedPage;
          },
          selectedIndex: selectedPage,
        );
      },
    );
  }
}
