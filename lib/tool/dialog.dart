import 'package:flutter/material.dart';

Future showOkDialog({
  required BuildContext context,
  required String title,
  required String message,
  required String action,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            child: Text(action),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );
    },
  );
}