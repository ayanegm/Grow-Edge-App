import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoRowListBookingSummary extends StatelessWidget {
  const InfoRowListBookingSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: const Color(0xFFDEE2E6), width: 1.0.w),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Date', style: TextStyle(fontSize: 13.sp)),
          Text('Jun 20, 2026', style: TextStyle(fontSize: 13.sp)),
        ],
      ),
    );
  }
}
