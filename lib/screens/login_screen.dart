import 'package:chat_app/component/custom_button.dart';
import 'package:chat_app/component/custom_textformfield.dart';
import 'package:chat_app/constant.dart';
import 'package:chat_app/screens/blocs/auth_bloc/auth_bloc.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../component/snackbar.dart';
import 'signUp_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';
  String? loginEmail;
  String? loginPassword;

  GlobalKey<FormState> formkey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          Navigator.pushNamed(context, ChatScreen.id, arguments: loginEmail);
          isLoading = false;
        } else if (state is LoginFailure) {
          showSnackBarToException(context, state.loginErrMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Form(
                key: formkey,
                child: ListView(
                  children: [
                    const SizedBox(height: 90),
                    Image.asset(kAssetImage, height: 100),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Chatter',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Pacifico',
                            fontSize: 32,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 75),
                    const Row(
                      children: [
                        Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      onChanged: (data) {
                        loginEmail = data;
                      },
                      hintText: 'Email',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      obscureText: true,
                      onChanged: (data) {
                        loginPassword = data;
                      },
                      hintText: 'Password',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                              loginEmail: loginEmail!,
                              loginPassword: loginPassword!));

                        } else {

                        }
                      },
                      buttonName: 'Sign In',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'don\'t have an account',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, SignUpScreen.id);
                          },
                          child: const Text(
                            ' Sign Up',
                            style: TextStyle(
                              color: Color(0XFFC7EDE6),
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
      },
    );
  }
}
