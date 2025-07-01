  import 'package:flutter/material.dart';

Future<dynamic> showDiolog({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context); 
                  },
                  child: Text("Ok")),
            ],
          );
        });
  }

     Future<dynamic> alertBox({
    required BuildContext context,
    required Function() onPressed,
        required String title,
    required String content,
    String? type,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
           type==null? TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("cancel")):SizedBox(),
            TextButton(onPressed: onPressed, child: Text("Ok"))
          ],
        );
      },
    );
  }