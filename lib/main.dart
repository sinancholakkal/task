import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/presentation/pages/screen_home/screen_home.dart';
import 'package:task/presentation/pages/screen_login/screen_login.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690), // base screen size
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenHome(),
      ),
    );
  }
}