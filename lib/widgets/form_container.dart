import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            height: 1,
            color: Color(0xFF212529),
          ),
        ),

        SizedBox(height: 4),
        Text(
          subTitle,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            height: 1,
            color: Color(0xFF212529),
          ),
        ),
      ],
    );
  }
}
