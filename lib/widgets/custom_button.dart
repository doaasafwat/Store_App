import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
  CustomButon({super.key, required this.text, this.onTap});
  final String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
            child: Text(
          text,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        )),
      ),
    );
  }
}
