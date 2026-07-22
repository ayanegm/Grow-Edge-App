import 'package:flutter/material.dart';

class FrameContainer extends StatelessWidget {
  const FrameContainer({
    super.key,
    this.isSelected = false,
    required this.title,
  });
  final bool isSelected;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 109,
      color: isSelected ? Color(0xFF393A6C) : Color(0xFFDEE2E6),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
