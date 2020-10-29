import 'package:flutter/material.dart';

class alertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback callback;
  final String buttontext;

  alertDialog(this.title, this.content, this.callback, [this.buttontext = "reset"]);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        FlatButton(
          onPressed: callback,
          child: Text(buttontext),
          color: Colors.blue,
        )
      ],
    );
  }
}
