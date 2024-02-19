import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.hint,
      this.textType,
      this.onchange,
      this.obscureText = false})
      : super(key: key);
  String? hint;
  TextInputType? textType;
  bool? obscureText;
  Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      onChanged: onchange,
      keyboardType: textType,
      decoration: InputDecoration(
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          )),
    );
  }
}
