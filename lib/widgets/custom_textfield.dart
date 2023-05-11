import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  
  const CustomTextField({
    super.key, 
    required this.controller, 
    required this.hintText, 
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}