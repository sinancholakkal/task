import 'package:flutter/material.dart';

class MyBottonWidget extends StatelessWidget {
  String text;
  void Function()? onTap;
  final Color color;
   MyBottonWidget({super.key,required this.text,required this.onTap,required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        textStyle: TextStyle(fontSize: 18),
      ),
    );
  }
}