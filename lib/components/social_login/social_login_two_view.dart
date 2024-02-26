import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginTwoView extends StatelessWidget {
  const SocialLoginTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Wrap(
            runSpacing: 12,
            spacing: 12,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDF4931),
                  minimumSize: const Size(64, 64),
                  shape: const CircleBorder(),
                ),
                onPressed: () {},
                child: SvgPicture.asset(
                  "assets/social_login/google.svg",
                  height: 24,
                  width: 24,
                ),
              ),
              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3A579B),
                  minimumSize: const Size(64, 64),
                  shape: const CircleBorder(),
                ),
                onPressed: () {},
                child: SvgPicture.asset(
                  "assets/social_login/facebook.svg",
                  height: 24,
                  width: 24,
                ),
              ),
              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF202020),
                  minimumSize: const Size(64, 64),
                  shape: const CircleBorder(),
                ),
                onPressed: () {},
                child: SvgPicture.asset(
                  "assets/social_login/github.svg",
                  height: 24,
                  width: 24,
                ),
              ),
              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF075E55),
                  minimumSize: const Size(64, 64),
                  shape: const CircleBorder(),
                ),
                onPressed: () {},
                child: SvgPicture.asset(
                  "assets/social_login/whatsapp.svg",
                  height: 24,
                  width: 24,
                ),
              ),
              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0184DF),
                  minimumSize: const Size(64, 64),
                  shape: const CircleBorder(),
                ),
                onPressed: () {},
                child: SvgPicture.asset(
                  "assets/social_login/linkedin.svg",
                  height: 24,
                  width: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
