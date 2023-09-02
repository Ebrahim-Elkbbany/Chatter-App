import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> loginFirebaseAuth(
      {required loginEmail, required loginPassword}) async {
    emit(LoginLoading());
    try{
      UserCredential user =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginEmail,
        password: loginPassword,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(loginErrMessage:'user-not-found' ));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(loginErrMessage:'wrong-password'));
      }
    } catch (e) {
      emit(LoginFailure(loginErrMessage: e.toString()));
    }
  }
  Future<void> signUpFirebaseAuth(
      {required signUpEmail, required signUpPassword }) async {
    emit(SignUpLoading());
    try {
      UserCredential user =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signUpEmail,
        password: signUpPassword,
      );
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailure(signUpErrorMessage: 'weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailure(signUpErrorMessage: 'email-already-in-use'));
      }
    } catch (e) {
      emit(SignUpFailure(signUpErrorMessage: e.toString()));
    }
  }
}
