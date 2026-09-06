import 'package:flutter/material.dart';
import 'package:grow_edge_app/core/widgets/custom_text_field.dart';
import 'package:grow_edge_app/widgets/text_field_title.dart';

class LabeledTextField extends StatelessWidget {
  const LabeledTextField({
    super.key,
    required this.title,
    required this.controller,
    required this.hintText,
    required this.isPassword,
  });
  final String title;
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldTitle(title: title),
        SizedBox(height: 8),
        CustomTextField(
          controller: controller,
          isPassword: isPassword,
          hintText: hintText,
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
