import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_edge_app/constants/app_colors.dart';
import 'package:grow_edge_app/features/coaches/data/models/coach_container_model.dart';

class CoachContainer extends StatelessWidget {
  CoachContainer({super.key, required this.coachModel});
  CoachContainerModel coachModel;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Container(
      color: Colors.white,
      height: 112.h,
      width: screenWidth * 0.89,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            coachModel.live_photo ?? '',
            height: 112.h,
            width: screenWidth * 0.267,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 112.h,
                width: screenWidth * 0.267,
                color: Colors.grey[200],
                child: const Icon(Icons.person, color: Colors.grey),
              );
            },
          ),
          SizedBox(width: screenWidth * 0.021),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              Text(
                coachModel.name!,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                coachModel.working_field!,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.Greenprimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                coachModel.name!,
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppColors.lightGray,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Image.asset(
                    'assets/images/Experience Icon.png',
                    width: 16.w,
                    height: 16.h,
                  ),
                  SizedBox(width: screenWidth * 0.001),
                  Text(
                    coachModel.experience!,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: AppColors.lightGray,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.032),
                  Image.asset(
                    'assets/images/Language Icon.png',
                    width: screenWidth * 0.043,
                    height: screenHeight * 0.02,
                  ),
                  SizedBox(width: screenWidth * 0.001),
                  Text(
                    coachModel.languages!,
                    style: TextStyle(
                      fontSize: screenWidth * 0.029,
                      color: AppColors.lightGray,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.015),
            ],
          ),
        ],
      ),
    );
  }
}
