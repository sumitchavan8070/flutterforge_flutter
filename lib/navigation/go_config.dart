import 'package:flutterfore_app/components/blur_container/blur_container_one_view.dart';
import 'package:flutterfore_app/components/calendar_template/calendar_template.dart';
import 'package:flutterfore_app/components/counting_text/counting_text_one_view.dart';
import 'package:flutterfore_app/components/date_select_drawer/date_select_one_view.dart';
import 'package:flutterfore_app/components/marquee/marquee_one_view.dart';
import 'package:flutterfore_app/components/onboarding/onboarding_one_view.dart';
import 'package:flutterfore_app/components/snackbar/snackbar_one.dart';
import 'package:flutterfore_app/components/social_login/social_login_one_view.dart';
import 'package:flutterfore_app/components/social_login/social_login_two_view.dart';
import 'package:flutterfore_app/components/tab_bar/tab_bar_one_view.dart';
import 'package:flutterfore_app/components/vertical_tab_bar/vertical_tab_bar_one_view.dart';
import 'package:flutterfore_app/main.dart';
import 'package:flutterfore_app/navigation/go_paths.dart';
import 'package:go_router/go_router.dart';

final goConfig = GoRouter(
  initialLocation: GoPaths.calendarTemplateOne,
  routes: [
    GoRoute(
      path: GoPaths.home,
      builder: (context, state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: GoPaths.snackbarOne,
      builder: (context, state) {
        return const SnackbarOneView();
      },
    ),
    GoRoute(
      path: GoPaths.onboardingOne,
      builder: (context, state) {
        return const OnboardingOneView();
      },
    ),
    GoRoute(
      path: GoPaths.socialLoginOne,
      builder: (context, state) {
        return const SocialLoginOneView();
      },
    ),
    GoRoute(
      path: GoPaths.socialLoginTwo,
      builder: (context, state) {
        return const SocialLoginTwoView();
      },
    ),
    GoRoute(
      path: GoPaths.tabBarOne,
      builder: (context, state) {
        return const TabBarOneView(tabBarType: 2);
      },
    ),
    GoRoute(
      path: GoPaths.tabBarTwo,
      builder: (context, state) {
        return const TabBarOneView(tabBarType: 2);
      },
    ),
    GoRoute(
      path: GoPaths.tabBarThree,
      builder: (context, state) {
        return const TabBarOneView(tabBarType: 3);
      },
    ),
    GoRoute(
      path: GoPaths.blurContainerOne,
      builder: (context, state) {
        return const BlurContainerOneView();
      },
    ),
    GoRoute(
      path: GoPaths.verticalTabBarOne,
      builder: (context, state) {
        return const VerticalTabBarOneView();
      },
    ),
    GoRoute(
      path: GoPaths.dateSelectOne,
      builder: (context, state) {
        return const DateSelectOneView();
      },
    ),
    GoRoute(
      path: GoPaths.marqueeOne,
      builder: (context, state) {
        return const MarqueeOneView();
      },
    ),
    GoRoute(
      path: GoPaths.countingText,
      builder: (context, state) {
        return const CountingTextOneView();
      },
    ),

    //    calendar_template Route
    GoRoute(
      path: GoPaths.calendarTemplateOne,
      builder: (context, state) {
        return const CalendarTemplateOne();
      },
    ),
  ],
);
