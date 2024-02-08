import 'package:flutterfore_app/main.dart';
import 'package:flutterfore_app/navigation/go_paths.dart';
import 'package:flutterfore_app/onboarding/onboarding_one_view.dart';
import 'package:flutterfore_app/snackbar/snackbar_one.dart';
import 'package:go_router/go_router.dart';

final goConfig = GoRouter(
  initialLocation: GoPaths.onboardingOne,
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
  ],
);
