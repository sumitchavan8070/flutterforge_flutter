import 'package:flutter/material.dart';
import 'package:flutterfore_app/utility/snackabr/snackbar_one.dart';


class SnackbarOneView extends StatelessWidget {
  const SnackbarOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width),
          ElevatedButton(
            onPressed: () {
              snackbarOne(
                context: context,
                content: "This is information",
                messageScaffoldType: SnackbarOneType.information,
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text("Information"),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              snackbarOne(
                context: context,
                content: "This is warning",
                messageScaffoldType: SnackbarOneType.warning,
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: const Text("Warning"),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              snackbarOne(
                context: context,
                content: "This is error",
                messageScaffoldType: SnackbarOneType.error,
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Error"),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              snackbarOne(
                context: context,
                content: "This is success",
                messageScaffoldType: SnackbarOneType.success,
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text("Success"),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}