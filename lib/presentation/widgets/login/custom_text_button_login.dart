import 'package:flutter/material.dart';

class CustomTextButtonLogin extends StatelessWidget {
  final VoidCallback? onPress;
  final String text;

  const CustomTextButtonLogin({super.key, this.onPress, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        child: Text(text)
    );
  }
}
