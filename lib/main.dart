import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/firebase_options.dart';
import 'package:task/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:task/presentation/pages/screen_home/screen_home.dart';
import 'package:task/presentation/pages/screen_login/screen_login.dart';
import 'package:task/presentation/pages/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder:
          (_, __) => MultiBlocProvider(
            providers: [BlocProvider(create: (context) => AuthBloc())],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            ),
          ),
    );
  }
}
