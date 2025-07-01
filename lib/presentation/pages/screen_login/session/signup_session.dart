import 'package:flutter/material.dart';
import 'package:task/core/colors.dart';
import 'package:task/presentation/pages/screen_signup/screen_signup.dart';

class SignupSession extends StatelessWidget {
  const SignupSession({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Not a member?", style: TextStyle(color: grey500)),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenSignup(),
              ),
            );
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: grey500,
            ),
          ),
        ),
      ],
    );
  }
}
