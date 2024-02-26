import 'package:flutter/material.dart';
import 'package:flutterfore_app/components/date_select_drawer/date_select_one_view.dart';
import 'package:flutterfore_app/components/marquee/marquee_one_view.dart';
import 'package:flutterfore_app/components/snackbar/snackbar_one.dart';
import 'package:flutterfore_app/components/social_login/social_login_one_view.dart';
import 'package:flutterfore_app/utility/tab_bar/tab_bar_one.dart';
import 'package:flutterfore_app/utility/tab_bar/tab_bar_three.dart';
import 'package:flutterfore_app/utility/tab_bar/tab_bar_two.dart';

final tabs = [
  "Snackbar",
  'Social Login',
  "Date Picker",
  "Marquee",
];

class TabBarOneView extends StatelessWidget {
  const TabBarOneView({super.key, required this.tabBarType});
  final int tabBarType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              if (tabBarType == 1) TabBarOne(tabs: tabs, isScrollable: true),
              if (tabBarType == 2)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: TabBarTwo(tabs: tabs, isScrollable: true),
                ),
              if (tabBarType == 3)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: TabBarThree(tabs: tabs, isScrollable: true),
                ),
              const SizedBox(height: 12),
              const Flexible(
                child: TabBarView(
                  children: [
                    SnackbarOneView(),
                    SocialLoginOneView(),
                    DateSelectOneView(),
                    MarqueeOneView(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
