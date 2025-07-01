import 'package:flutter/material.dart';
import 'package:task/core/colors.dart';
import 'package:task/presentation/pages/screen_signup/screen_signup.dart';
import 'package:task/presentation/widgets/email_field_widget.dart';
import 'package:task/presentation/widgets/login_and_signup_button.dart';
import 'package:task/presentation/widgets/password_field_widget.dart';

class ScreenLogin extends StatelessWidget {
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
                  'Login',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),

                // Email field
                EmailFieldWidget(emailController: emailController),
                SizedBox(height: 20),

                // Password field
                PasswordFieldWidget(passwordController: passwordController),
                SizedBox(height: 30),

                // Login button
                MyBottonWidget(text: "Login", onTap: (){}, color: Colors.white),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member?", style: TextStyle(color: grey500)),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenSignup()));
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





