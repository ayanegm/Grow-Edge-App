import 'package:flutter/material.dart';
import 'package:grow_edge_app/constants/app_colors.dart';

class SearchTextField extends StatefulWidget {
  SearchTextField({
    super.key,
    required this.controller,
    this.validator,
    this.hintText,
  });
  TextEditingController controller;
  String? Function(String?)? validator;
  String? hintText;
  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return SizedBox(
      height: screenHeight * 0.059,
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFDEE2E6)),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Padding(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Image.asset(
              'assets/images/Search Icon.png',
              width: screenWidth * 0.064,
              height: screenHeight * 0.029,
            ),
          ),
          hintText: widget.hintText,
          contentPadding: EdgeInsets.fromLTRB(
            screenWidth * 0.032,
            screenHeight * 0.017,
            screenWidth * 0.032,
            screenHeight * 0.017,
          ),
          hintStyle: TextStyle(
            color: AppColors.lightGray,
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
