part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginInitial extends AuthState {}
class LoginLoading extends AuthState{}
class LoginSuccess extends AuthState{}
class LoginFailure extends AuthState{
 final String  loginErrMessage ;
  LoginFailure({required this.loginErrMessage});
}

class SignUpInitial extends AuthState {}
class SignUpLoading extends AuthState {}
class SignUpSuccess extends AuthState {}
class SignUpFailure extends AuthState {
 final  String signUpErrorMessage;
  SignUpFailure({required this.signUpErrorMessage});

}
