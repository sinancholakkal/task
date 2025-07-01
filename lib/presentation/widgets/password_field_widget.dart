import 'package:flutter/material.dart';

class PasswordFieldWidget extends StatelessWidget {
  const PasswordFieldWidget({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
      obscureText: true,
    );
  }
}
