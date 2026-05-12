import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.controller,
    this.textInputType,
    this.obscureText,
    this.onSaved,
    this.prefixIcon,
  });
  final String hintText;
  final Function(String?)? onSaved;
  final IconButton? suffixIcon;
  final IconButton? prefixIcon;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      obscureText: obscureText ?? false,
      keyboardType: textInputType,
      validator: (v) {
        if (v!.isEmpty) {
          return 'field is required';
        } else {
          return null;
        }
      },
      controller: controller,
      decoration: InputDecoration(
        fillColor: Color(0xffF9FAFA),
        filled: true,

        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        suffixIconColor: Colors.grey,
        suffixStyle: TextStyle(fontSize: 20),
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }
}
