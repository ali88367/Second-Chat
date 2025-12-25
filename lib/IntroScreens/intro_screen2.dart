import 'package:flutter/material.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Stack(
            children: [
              // Base background
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(0, -0.3),
                    radius: 0.8,
                    colors: [
                      Color.fromRGBO(255, 230, 167, 0.25),
                      Color(0xFF2D2926),
                      Color(0xFF1A1816),
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ),
                ),              ),

            ],
          ),
        ],
      ),
    );
  }
}
