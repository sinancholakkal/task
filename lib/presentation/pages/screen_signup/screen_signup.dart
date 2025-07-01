import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/until/validation.dart';
import 'package:task/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:task/presentation/pages/screen_home/screen_home.dart';
import 'package:task/presentation/widgets/email_field_widget.dart';
import 'package:task/presentation/widgets/loading_widget.dart';
import 'package:task/presentation/widgets/login_and_signup_button.dart';
import 'package:task/presentation/widgets/password_field_widget.dart';
import 'package:task/presentation/widgets/showDiolog.dart';

class ScreenSignup extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ScreenHome()),
          );
        } else if (state is AuthErrorState) {
          Navigator.pop(context); // close loading dialog if open
          showDiolog(
            context: context,
            title: "Error",
            content: state.errorMessage,
          );
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
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),

                    // Name field
                    TextFormField(
                      validator:
                          (value) => Validation.nameValidate(value: value),
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
                      validator:
                          (value) => Validation.passWordValidation(value),
                    ),
                    SizedBox(height: 30),

                    // Sign Up button
                    MyBottonWidget(
                      color: Colors.white,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          log(" Validated--------------------");
                          context.read<AuthBloc>().add(
                            SignUpEvent(
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
