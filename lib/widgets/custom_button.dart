import 'package:flutter/material.dart';
import 'package:grow_edge_app/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.buttonColor = AppColors.Blueprimary,
  });
  final String text;
  final VoidCallback onTap;
  final Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: buttonColor,
        height: 44,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
