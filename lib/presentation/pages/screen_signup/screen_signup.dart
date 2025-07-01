
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:task/presentation/pages/screen_home/screen_home.dart';
import 'package:task/presentation/pages/screen_signup/session/signup_button_session.dart';
import 'package:task/presentation/pages/screen_signup/session/signup_session.dart';
import 'package:task/presentation/widgets/loading_widget.dart';
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
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => ScreenHome()),
            (route) => false,
          );
        } else if (state is AuthErrorState) {
          Navigator.pop(context);
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
                    //SignUp field session(name,email,password)
                    SignUpSession(nameController: nameController, emailController: emailController, passwordController: passwordController),
                    // Sign Up button
                    SignupButtonSession(formKey: _formKey, nameController: nameController, emailController: emailController, passwordController: passwordController),
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


