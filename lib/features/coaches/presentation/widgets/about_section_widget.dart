import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutSectionWidget extends StatelessWidget {
  const AboutSectionWidget({super.key, this.bio});
  final String? bio;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 12.h),
          Text('About', style: TextStyle(fontSize: 15.sp)),
          SizedBox(height: 12.h),
          Text(bio!, style: TextStyle(fontSize: 11.sp)),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
