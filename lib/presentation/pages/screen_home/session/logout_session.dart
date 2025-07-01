import 'package:flutter/material.dart';
import 'package:task/domain/repository/auth_services.dart';
import 'package:task/presentation/pages/screen_login/screen_login.dart';
import 'package:task/presentation/widgets/showDiolog.dart';

class LogoutSession extends StatelessWidget {
  const LogoutSession({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        alertBox(
          context: context,
          onPressed: () {
            AuthService().signOut();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => ScreenLogin()),
              (route) => false,
            );
          },
          title: "Logout",
          content: "Are you sure you want to logout?",
        );
      },
      child: Icon(Icons.logout),
    );
  }
}

