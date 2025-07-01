import 'package:flutter/material.dart';
import 'package:task/presentation/pages/screen_login/screen_login.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenLogin(),
    );
  }
}