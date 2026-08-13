import 'package:flutter/material.dart';

class CrImageWidget extends StatelessWidget {
  const CrImageWidget({super.key, required this.onTap, required this.fileName});
  final VoidCallback onTap;
  final String fileName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFFDEE2E6)),
      ),
      height: 48,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14),
        child: Row(
          children: [
            GestureDetector(
              onTap: onTap,
              child: Text(
                'Choose file',
                style: TextStyle(
                  color: Color(0xFF969FA8),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(width: 8),
            Text(
              '|',
              style: TextStyle(
                color: Color(0xFF969FA8),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 8),
            Text(
              fileName,
              style: TextStyle(
                color: fileName == 'No file chosen'
                    ? Color(0xFF969FA8)
                    : Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
