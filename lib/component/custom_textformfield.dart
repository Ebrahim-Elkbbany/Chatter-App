import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key, required this.hintText,this.onChanged,this.obscureText=false});
  String? hintText;
  Function (String) ?onChanged;
  bool ? obscureText ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (data) {
        if(data!.isEmpty){
          return 'This field is required';
        }

      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white
          )
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white
            )
        ),

      ),
    );
  }
}
