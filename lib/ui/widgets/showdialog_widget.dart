import 'package:flutter/material.dart';

class ShowdialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Emergency SOS'),
      content: Text('Would you like to activate the emergency SOS service?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Activate'),
        ),
      ],
    );
  }
}
