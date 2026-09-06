import 'package:flutter/material.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,

      child: Container(
        color: Colors.white,
        width: 375,
        height: 298,
        child: Column(
          children: [
            SizedBox(height: 32),
            Image.asset(
              'assets/images/success_Icon.png',
              height: 152,
              width: 152,
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to Grow Edge',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            SizedBox(height: 8),
            Text(
              'Your account has been created successfully.',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
