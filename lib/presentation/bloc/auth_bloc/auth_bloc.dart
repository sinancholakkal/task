import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:task/domain/repository/auth_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _authService = AuthService();
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>(
      (event, emit) async {
        emit(AuthLoadingState());
        await Future.delayed(Duration(seconds: 2));
        try {
          final user = await _authService.createUserWithEmailAndPassword(
              event.email, event.password);
          if(user==null){
            emit(AuthErrorState(errorMessage: "User creation failed"));
          }else{
            emit(AuthSuccessState(user: user));
          }
        } on FirebaseAuthException catch (e) {
          log("Somthing wrong while Sign Up ${e.code}");
          emit(AuthErrorState(errorMessage: e.code));
        }
      },
    );
  }
}
