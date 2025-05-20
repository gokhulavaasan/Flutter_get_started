import 'package:flutter/material.dart';
import 'package:my_app_1/views/pages/profile_page.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key, required this.title, this.nextpage});

  final String title;
  final Widget? nextpage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextpage != null
          ? () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return nextpage!;
              }));
            }
          : null,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Hero(
            tag: 'pic1',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset('assets/images/camera.jpg'),
            ),
          ),
          FittedBox(
            child: Text(title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                    letterSpacing: 50.0,
                    color: Colors.white30)),
          )
        ],
      ),
    );
  }
}
