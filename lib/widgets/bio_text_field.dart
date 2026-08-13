import 'package:flutter/material.dart';

class BioTextField extends StatelessWidget {
  const BioTextField({super.key, required this.bio, this.hintText});
  final TextEditingController bio;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 343,
      child: TextField(
        maxLines: null,
        controller: bio,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFDEE2E6)),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: Color(0xFF969FA8),
          ),
        ),
      ),
    );
  }
}
