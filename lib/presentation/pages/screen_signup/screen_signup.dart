import 'package:flutter/material.dart';
import 'package:task/presentation/widgets/email_field_widget.dart';
import 'package:task/presentation/widgets/login_and_signup_button.dart';
import 'package:task/presentation/widgets/password_field_widget.dart';

class ScreenSignup extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),

                // Name field
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),

                // Email field
                EmailFieldWidget(emailController: emailController),
                SizedBox(height: 20),

                // Password field
                PasswordFieldWidget(passwordController: passwordController),
                SizedBox(height: 30),

                // Sign Up button
                MyBottonWidget(
                  color: Colors.white,
                  onTap: () {
                    
                  },
                  text: "Sign Up",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
