import 'package:flutter/material.dart';
import 'package:grow_edge_app/constants/app_colors.dart';
import 'package:grow_edge_app/widgets/custom_button.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({
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
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 16),
            CustomButton(onTap: onTap, text: text, buttonColor: buttonColor),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
