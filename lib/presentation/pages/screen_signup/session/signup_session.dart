import 'package:flutter/material.dart';
import 'package:task/core/until/validation.dart';
import 'package:task/presentation/widgets/email_field_widget.dart';
import 'package:task/presentation/widgets/password_field_widget.dart';

class SignUpSession extends StatelessWidget {
  const SignUpSession({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            'Sign Up',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),

          // Name field
          TextFormField(
            validator: (value) => Validation.nameValidate(value: value),
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),

          // Email field
          EmailFieldWidget(
            emailController: emailController,
            validator: (value) {
              return Validation.emailValidation(value);
            },
          ),
          SizedBox(height: 20),

          // Password field
          PasswordFieldWidget(
            passwordController: passwordController,
            validator: (value) => Validation.passWordValidation(value),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
