import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.controller,
    this.validator,
    this.onTap,
    required this.isPassword,
    this.field_title,
  });
  TextEditingController controller;
  String? Function(String?)? validator;
  final VoidCallback? onTap;
  final bool isPassword;
  String? field_title;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    // Initialize with the value passed from the parent
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      obscureText: _obscureText,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFDEE2E6)),
        ),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        hintText: widget.field_title,
        contentPadding: EdgeInsets.fromLTRB(12.0, 14.0, 12.0, 14.0),

        hintStyle: const TextStyle(
          color: Color(0xFF969FA8),
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
