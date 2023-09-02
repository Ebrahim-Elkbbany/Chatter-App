import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({ this.buttonName,this.onTap}) ;
  String ?buttonName;
   VoidCallback ? onTap;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 50,
        width: double.infinity,
        child: Center(child: Text(buttonName!,style:const  TextStyle(
          fontWeight: FontWeight.bold
        )),),
      ),
    );
  }
}
