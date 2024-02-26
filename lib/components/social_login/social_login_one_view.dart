import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginOneView extends StatelessWidget {
  const SocialLoginOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDF4931),
                  minimumSize: const Size(100, 52),
                  maximumSize: const Size(240, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/social_login/google.svg",
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(width: 12),
                    const Text("Continue with Google",)
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3A579B),
                  minimumSize: const Size(100, 52),
                  maximumSize: const Size(240, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/social_login/facebook.svg",
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(width: 12),
                    const Text("Continue with Facebook") 
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF202020),
                  minimumSize: const Size(100, 52),
                  maximumSize: const Size(240, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/social_login/github.svg",
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(width: 12),
                    const Text("Continue with GitHub") 
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF075E55),
                  minimumSize: const Size(100, 52),
                  maximumSize: const Size(240, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/social_login/whatsapp.svg",
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(width: 12),
                    const Text("Continue with WhatsApp") 
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0184DF),
                  minimumSize: const Size(100, 52),
                  maximumSize: const Size(240, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/social_login/linkedin.svg",
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(width: 12),
                    const Text("Continue with LinkedIn") 
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
