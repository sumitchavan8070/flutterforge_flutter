import 'package:flutter/material.dart';
import 'package:flutterfore_app/components/blur_container/blur_container_one_view.dart';
import 'package:flutterfore_app/components/date_select_drawer/date_select_one_view.dart';
import 'package:flutterfore_app/components/marquee/marquee_one_view.dart';
import 'package:flutterfore_app/components/snackbar/snackbar_one.dart';
import 'package:flutterfore_app/components/social_login/social_login_one_view.dart';
import 'package:flutterfore_app/components/social_login/social_login_two_view.dart';
import 'package:flutterfore_app/components/tab_bar/tab_bar_one_view.dart';
import 'package:flutterfore_app/components/vertical_tab_bar/vertical_tab_bar.dart';

class VerticalTabBarOneView extends StatelessWidget {
  const VerticalTabBarOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VerticalTabs(
        initialIndex: 2,
        tabsWidth: 140,
        tabs: const [
          Tab(text: "Social Login"),
          Tab(text: "Snackbar"),
          Tab(text: "Date Picker"),
          Tab(text: "Marquee"),
        ],
        contents: const [
          SocialLoginTwoView(),
          SnackbarOneView(),
          DateSelectOneView(),
          MarqueeOneView(),
        ],
      ),
    );
  }
}
