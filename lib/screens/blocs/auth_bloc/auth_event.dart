part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String loginEmail;
  final String  loginPassword;
  LoginEvent({required this.loginEmail,required this.loginPassword});
}

class SignUpEvent extends AuthEvent {
  final String signUpEmail;
  final String signUpPassword;

  SignUpEvent({required this.signUpEmail,required this.signUpPassword});

}
