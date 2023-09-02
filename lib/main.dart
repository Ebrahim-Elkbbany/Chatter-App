import 'package:chat_app/screens/blocs/auth_bloc/auth_bloc.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/screens/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/signUp_screen.dart';
import 'package:chat_app/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
  Bloc.observer = AppBlocObserver();
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SplashScreen.id: (context) => (const SplashScreen()),
          SignUpScreen.id: (context) => (SignUpScreen()),
          LoginScreen.id: (context) => (LoginScreen()),
          ChatScreen.id: (context) => (ChatScreen()),
        },
        initialRoute: SplashScreen.id,
      ),
    );
  }
}
