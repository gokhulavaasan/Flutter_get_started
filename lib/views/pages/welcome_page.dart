import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_app_1/views/pages/login_page.dart';
import 'package:my_app_1/views/pages/onboarding_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/lotties/bootanimation.json',
                  height: 400.0,
                ),
                const FittedBox(
                  child: Text(
                    'Flutter Map',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                        letterSpacing: 50.0),
                  ),
                ),
                const SizedBox(height: 20.0),
                FilledButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const OnboardingPage();
                    }));
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40.0),
                  ),
                  child: const Text('Get Started'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginPage(
                        title: 'Login',
                      );
                    }));
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40.0),
                  ),
                  child: const Text('Login'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
