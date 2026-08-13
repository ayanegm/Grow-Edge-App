import 'package:flutter/material.dart';
import 'package:grow_edge_app/constants/app_colors.dart';

class GenderButton extends StatelessWidget {
  const GenderButton({
    super.key,
    required this.imageLink,
    required this.gender_type,
    this.isSelected = false,
    required this.onTap,
  });
  final String imageLink;
  final String gender_type;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          border: Border.all(
            width: isSelected ? 1 : 1,
            color: isSelected ? AppColors.Blueprimary : Color(0xFFDEE2E6),
          ),
        ),
        width: 167.5,
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imageLink),
            SizedBox(width: 8),
            Text(
              gender_type,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: isSelected
                    ? AppColors.Blueprimary
                    : Color(
                        0xFF969FA8,
                      ), // تغيير لون النص أيضاً عند الاختيار إذا أردت
              ),
            ),
          ],
        ),
      ),
    );
  }
}
