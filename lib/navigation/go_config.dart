import 'package:flutterfore_app/main.dart';
import 'package:flutterfore_app/navigation/go_paths.dart';
import 'package:flutterfore_app/snackbar_one.dart';
import 'package:go_router/go_router.dart';

final goConfig = GoRouter(
  initialLocation: GoPaths.snackbarOne,
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
        return const SnackbarOne();
      },
    ),
  ],
);
