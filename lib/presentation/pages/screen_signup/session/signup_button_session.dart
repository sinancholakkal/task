import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:task/presentation/widgets/login_and_signup_button.dart';

class SignupButtonSession extends StatelessWidget {
  const SignupButtonSession({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return MyBottonWidget(
      color: Colors.white,
      onTap: () {
        if (_formKey.currentState!.validate()) {
          log(" Validated--------------------");
          context.read<AuthBloc>().add(
            SignUpEvent(
              name: nameController.text.trim(),
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
            ),
          );
          // _signIn(context);
        } else {
          print("Not Validated--------------------");
        }
      },
      text: "Sign Up",
    );
  }
}
