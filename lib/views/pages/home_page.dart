import 'package:flutter/material.dart';
import 'package:my_app_1/views/data/constants.dart';
import 'package:my_app_1/views/pages/course_page.dart';
import 'package:my_app_1/views/pages/profile_page.dart';
import 'package:my_app_1/views/widgets/container_widget.dart';
import 'package:my_app_1/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      KValue.keyConcepts,
      KValue.basicLayout,
      KValue.cleanUi,
      KValue.fixBugs,
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            const HeroWidget(
              title: 'Flutter MAP',
              nextpage: CoursePage(),
            ),
            const SizedBox(height: 5.0),
            Column(
                children: List.generate(
              list.length,
              (index) {
                return ContainerWidget(
                  title: list.elementAt(index),
                  description: "The description of this",
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
