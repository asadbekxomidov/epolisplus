import 'package:epolisplus/utils/utils_export.dart';
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

class MyShowWarrantCodeScreenDilog extends StatelessWidget {
  late Dimens dimens;
  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.3,
        maxChildSize: 0.7,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Text(
                      "Hamkorlarimiz haqida ma'lumot",
                      style: dimens.font16Blackw400Sty,
                    ),
                    Text(
                      '',
                      style: dimens.font14Greyw400Sty,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
