import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_edge_app/features/coaches/data/models/coach_container_model.dart';
import 'package:grow_edge_app/generated/assets.dart';

class CoachContainerProfile extends StatelessWidget {
  CoachContainerProfile({super.key, required this.coachModel});
  CoachContainerModel coachModel;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final screenHeight = mediaQuery.size.height;

    return SizedBox(
      height: 213.h,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 17.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(54),
              child: Image.asset(
                Assets.profileImage,
                height: 78.h,
                width: 78.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.h),
            Text(coachModel.name!, style: TextStyle(fontSize: 20.sp)),
            SizedBox(height: 4.h),
            Text(coachModel.working_field!, style: TextStyle(fontSize: 13.sp)),
            SizedBox(height: 12.h),
            SizedBox(height: 17.h),
          ],
        ),
      ),
    );
  }
}
