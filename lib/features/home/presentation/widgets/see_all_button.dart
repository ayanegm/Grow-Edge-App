import 'package:flutter/material.dart';
import 'package:grow_edge_app/constants/app_colors.dart';

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'See All',
          style: TextStyle(
            fontSize: 13,
            color: AppColors.green,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 3),
        Image.asset(
          'assets/images/Vector (Stroke).png',
          height: 10.33,
          width: 7.67,
        ),
      ],
    );
  }
}
