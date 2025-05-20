import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_app_1/views/data/constants.dart';
import 'package:my_app_1/views/pages/login_page.dart';


class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/lotties/welcome.json',
                  height: 400.0,
                ),
                // HeroWidget(title: widget.title),
                const Text(
                  'Flutter Map is the way to learn Flutter',
                  style: KTextStyle.headerTextStyle,
                ),
                const SizedBox(height: 20.0),
                FilledButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginPage(title: 'Register');
                    }));
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40.0),
                  ),
                  child: const Text('Next'),
                ),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
