import 'package:flutter/material.dart';

class TextFieldTitle extends StatelessWidget {
  const TextFieldTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 13,
        height: 1,
        color: Color(0xFF212529),
      ),
    );
  }
}
