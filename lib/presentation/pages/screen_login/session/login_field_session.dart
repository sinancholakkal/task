import 'package:flutter/material.dart';
import 'package:task/core/until/validation.dart';
import 'package:task/presentation/widgets/email_field_widget.dart';
import 'package:task/presentation/widgets/password_field_widget.dart';

class LoginFieldSession extends StatelessWidget {
  const LoginFieldSession({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: Column(
      children: [
        Text(
      'Login',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
    SizedBox(height: 40),
    
    // Email field
    EmailFieldWidget(
      emailController: emailController,
      validator: (value) => Validation.emailValidation(value),
    ),
    SizedBox(height: 20),
    
    // Password field
    PasswordFieldWidget(
      passwordController: passwordController,
      validator:
          (value) => Validation.passWordValidation(value),
    ),
    SizedBox(height: 30),
      ],
    ),);
  }
}
