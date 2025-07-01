
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:task/presentation/pages/screen_home/screen_home.dart';
import 'package:task/presentation/pages/screen_login/session/login_field_session.dart';
import 'package:task/presentation/pages/screen_login/session/login_session.dart';
import 'package:task/presentation/pages/screen_login/session/signup_session.dart';
import 'package:task/presentation/widgets/loading_widget.dart';
import 'package:task/presentation/widgets/showDiolog.dart';

class ScreenLogin extends StatefulWidget {
  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  late TextEditingController emailController;

  late TextEditingController passwordController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                    //Heading and login field session
                    LoginFieldSession(
                      emailController: emailController,
                      passwordController: passwordController,
                    ),

                    // Login button
                    LoginSession(
                      formKey: _formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                    //Not a member session---
                    SignupSession(),
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
