import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackageIncludedDetailsRows extends StatelessWidget {
  const PackageIncludedDetailsRows({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.check_circle_outline_rounded,
            color: Colors.green,
            size: 20,
          ),
          Text(
            'Full DISC Assessment & Personality Mapping',
            style: TextStyle(fontSize: 13.sp),
          ),
        ],
      ),
    );
  }
}
