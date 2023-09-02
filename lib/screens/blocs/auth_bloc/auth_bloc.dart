import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on <AuthEvent>((event, emit)async  {
      if(event is LoginEvent){
        emit(LoginLoading());
        try{
          UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.loginEmail,
            password: event.loginPassword,
          );
          emit(LoginSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(LoginFailure(loginErrMessage:'user-not-found' ));
          } else if (e.code == 'wrong-password') {
            emit(LoginFailure(loginErrMessage:'wrong-password'));
          }else{
            emit(LoginFailure(loginErrMessage: e.code));
          }
        } catch (e) {
          emit(LoginFailure(loginErrMessage: e.toString()));
        }
      }
      else if (event is SignUpEvent){
        emit(SignUpLoading());

        try {

          UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.signUpEmail,
            password: event.signUpPassword,
          );
          emit(SignUpSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            emit(SignUpFailure(signUpErrorMessage: 'weak-password'));
          } else if (e.code == 'email-already-in-use') {
            emit(SignUpFailure(signUpErrorMessage: 'email-already-in-use'));
          }else{
            emit(SignUpFailure(signUpErrorMessage: e.code));
          }
        } catch (e) {
          emit(SignUpFailure(signUpErrorMessage: e.toString()));
        }
      }


    });
  }
}
