import 'package:flutter/material.dart';

class OnboardingOneView extends StatefulWidget {
  const OnboardingOneView({super.key});

  @override
  State<OnboardingOneView> createState() => _OnboardingOneViewState();
}

class _OnboardingOneViewState extends State<OnboardingOneView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            const Spacer(),


            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: PageView.builder(
                itemCount: onboardingData.length,
                onPageChanged: (value) {
                  setState(() {
                    _selectedIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardContent(
                    illustration: onboardingData[index]['iconPath'],
                    title: onboardingData[index]['title'],
                    text: onboardingData[index]['subtitle'],
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            AnimatedPageIndicator(
              length: 3,
              activeIndex: _selectedIndex,
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(54)),
              onPressed: () {},
              child: const Text("Get Started"),
            )
          ],
        ),
      ),
    );
  }
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.illustration,
    required this.title,
    required this.text,
  });

  final String illustration, title, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(illustration),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class AnimatedPageIndicator extends StatelessWidget {
  const AnimatedPageIndicator({
    super.key,
    required this.length,
    required this.activeIndex,
  });

  final int length;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(length, (index) {
        return AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          duration: const Duration(milliseconds: 300),
          height: 6,
          width: activeIndex == index ? 20 : 6,
          decoration: BoxDecoration(
            color: activeIndex == index
                ? Theme.of(context).primaryColor
                : const Color(0xFF868686).withOpacity(0.25),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        );
      }),
    );
  }
}

List<Map<String, dynamic>> onboardingData = [
  {
    'title': "Effortlessly Add Items to Your Cart",
    'subtitle':
        "Simplify Your Shopping Experience by Quickly Adding Your Desired Products to Your Virtual Cart with Ease and Convenience",
    'iconPath': "assets/onboarding/add_to_cart.png"
  },
  {
    'title': "Manage Your Finances Anywhere",
    'subtitle':
        "Enjoy the Freedom of Securely Accessing and Managing Your Funds Anytime, Anywhere, with Our Convenient Wallet Feature",
    'iconPath': "assets/onboarding/wallet.png"
  },
  {
    'title': "Plan for Tomorrow, Today",
    'subtitle':
        "Take Control of Your Financial Future by Easily Setting Aside Savings for Your Goals, Making Tomorrow's Dreams Achievable Today",
    'iconPath': "assets/onboarding/saving.png"
  }
];
