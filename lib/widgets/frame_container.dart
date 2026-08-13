import 'package:flutter/material.dart';

class FrameContainer extends StatefulWidget {
  const FrameContainer({
    super.key,
    this.isSelected = false,
    required this.title,
    required this.onTap,
  });
  final bool isSelected;
  final String title;
  final VoidCallback onTap;
  @override
  State<FrameContainer> createState() => _FrameContainerState();
}

class _FrameContainerState extends State<FrameContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 36,
        width: 109,
        color: widget.isSelected ? Color(0xFF393A6C) : Color(0xFFDEE2E6),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
