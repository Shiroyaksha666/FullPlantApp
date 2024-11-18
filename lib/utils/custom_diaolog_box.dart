import 'package:flutter/material.dart';

class CustomDiaolog {
  static void showmessage(
    BuildContext context,
    String title,
    String message,
    String buttonText,
    final VoidCallback onpressed,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(onPressed: onpressed, child: Text(buttonText))
            ],
          ),
        );
      },
    );
  }
}
