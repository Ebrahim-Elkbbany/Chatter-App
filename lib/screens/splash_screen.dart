import 'package:chat_app/constant.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static  String id = 'splash Screen';
  State<SplashScreen> createState() => _SplashScreenState();


}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushNamed(context, LoginScreen.id);
    }) ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(kAssetImage,height: 100),
          const SizedBox(height: 5,),
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
        ]
        ,)
    );
  }
}
