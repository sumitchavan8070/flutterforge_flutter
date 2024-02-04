import 'package:flutter/material.dart';

class SnackbarOne extends StatelessWidget {
  const SnackbarOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Information"),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Warning"),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Error"),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Success"),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}


