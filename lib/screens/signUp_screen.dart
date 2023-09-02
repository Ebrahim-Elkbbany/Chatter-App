import 'package:chat_app/constant.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../component/custom_button.dart';
import '../component/custom_textformfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../component/snackbar.dart';
import 'blocs/auth_bloc/auth_bloc.dart';

class SignUpScreen extends StatelessWidget {
  static String id = 'SignUp';
  String? signUpEmail;
  String? signUpPassword;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          isLoading = true;
        } else if (state is SignUpSuccess) {
          Navigator.pushNamed(context, ChatScreen.id, arguments: signUpEmail);
          isLoading = false;
        } else if (state is SignUpFailure) {
          isLoading = false;
          showSnackBarToException(context, state.signUpErrorMessage);
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
                key: formKey,
                child: ListView(
                  children: [
                    const SizedBox(height: 90),
                    Image.asset('assets/images/scholar.png', height: 100),
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
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      onChanged: (data) {
                        signUpEmail = data;
                      },
                      hintText: 'Email',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      obscureText: true,
                      onChanged: (data) {
                        signUpPassword = data;
                      },
                      hintText: 'Password',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(SignUpEvent(
                              signUpEmail: signUpEmail!,
                              signUpPassword: signUpPassword!));
                        } else {}
                      },
                      buttonName: 'Sign Up',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'already have have an account',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            '  Login',
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
