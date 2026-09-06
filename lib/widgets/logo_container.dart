import 'package:flutter/material.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({super.key, this.childWidget});
  final Widget? childWidget;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;

    return Container(
      width: double.infinity,
      height: screenHeight * 0.122,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF50B04D), Color(0xFFF5F5F5)],
        ),
      ),
      child: childWidget,
    );
  }
}
