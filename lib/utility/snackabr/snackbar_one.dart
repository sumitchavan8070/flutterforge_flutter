import 'package:flutter/material.dart';

enum SnackbarOneType {
  success,
  error,
  warning,
  information,
}

snackbarOne({
  required BuildContext context,
  required String content,
  int duration = 4,
  SnackbarOneType messageScaffoldType = SnackbarOneType.information,
}) {
  Color backgroundColor = Colors.white;
  Color mainColor = Colors.blue;
  IconData stateIcon = Icons.info_outline;

  switch (messageScaffoldType) {
    case SnackbarOneType.success:
      backgroundColor = Colors.green.shade50;
      mainColor = Colors.green;
      stateIcon = Icons.check;
      break;

    case SnackbarOneType.error:
      backgroundColor = Colors.red.shade50;
      mainColor = Colors.red;
      stateIcon = Icons.cancel_outlined;
      break;

    case SnackbarOneType.warning:
      backgroundColor = Colors.amber.shade50;
      mainColor = Colors.amber.shade600;
      stateIcon = Icons.warning_amber;
      break;

    case SnackbarOneType.information:
      backgroundColor = Colors.blue.shade50;
      mainColor = Colors.blue;
      stateIcon = Icons.info_outline;
      break;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: mainColor, width: 0.4),
      ),
      content: Row(
        children: [
          Icon(stateIcon, color: mainColor),
          const SizedBox(width: 12),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: mainColor),
          ),
        ],
      ),
      duration: Duration(seconds: duration),
    ),
  );
}