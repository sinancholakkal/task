import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:task/presentation/widgets/login_and_signup_button.dart';

class LoginSession extends StatelessWidget {
  const LoginSession({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.passwordController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return MyBottonWidget(
      text: "Login",
      onTap: () {
        if (_formKey.currentState!.validate()) {
          log(" Validated--------------------");
          context.read<AuthBloc>().add(
            SignInEvent(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            ),
          );
        } else {
          print("Not Validated--------------------");
        }
      },
      color: Colors.white,
    );
  }
}