import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_edge_app/constants/app_colors.dart';

class ContainersExpertiseWidget extends StatelessWidget {
  const ContainersExpertiseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
      color: const Color.fromARGB(255, 175, 232, 177),
      child: Center(
        child: Text(
          'Leadership Development',
          style: TextStyle(fontSize: 11.sp),
        ),
      ),
    );
  }
}
