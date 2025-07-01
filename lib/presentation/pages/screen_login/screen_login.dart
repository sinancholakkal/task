import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/colors.dart';
import 'package:task/core/until/validation.dart';
import 'package:task/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:task/presentation/pages/screen_home/screen_home.dart';
import 'package:task/presentation/pages/screen_signup/screen_signup.dart';
import 'package:task/presentation/widgets/email_field_widget.dart';
import 'package:task/presentation/widgets/loading_widget.dart';
import 'package:task/presentation/widgets/login_and_signup_button.dart';
import 'package:task/presentation/widgets/password_field_widget.dart';
import 'package:task/presentation/widgets/showDiolog.dart';

class ScreenLogin extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          loadingWidget(context);
        } else if (state is AuthSuccessState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => ScreenHome()),
            (route) => false,
          );
        } else if (state is AuthErrorState) {
          if (state.errorMessage == "invalid-credential") {
            Navigator.pop(context);
            showDiolog(
              context: context,
              title: "Incorrect Password",
              content:
                  "The password you entered is incorrect.\nPlease try again.",
            );
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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

                    // Login button
                    MyBottonWidget(
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
                    ),
                    Row(
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
