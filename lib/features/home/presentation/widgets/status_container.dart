import 'package:flutter/material.dart';

class StatusContainer extends StatelessWidget {
  StatusContainer({super.key, required this.text, this.isOpened = false,this.isClosed=false});
  final String text;
  final bool isOpened;
  final bool isClosed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 19,
      width: 41,
      decoration: BoxDecoration(color: Color(0xFFECECF1)),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Color(0xFF393A6C),
        ),
      ),
    );
  }
}
