import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_edge_app/constants/app_colors.dart';
import 'package:grow_edge_app/features/coaches/presentation/widgets/booking_session_details_container.dart';
import 'package:grow_edge_app/features/coaches/presentation/widgets/package_included_details_rows.dart';
import 'package:grow_edge_app/widgets/bottom_navigation_bar_widget.dart';
import 'package:grow_edge_app/widgets/button_container.dart';
import 'package:grow_edge_app/widgets/logo_container.dart';

class PackageBookingSummaryPage extends StatelessWidget {
  const PackageBookingSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(currentIndex: 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LogoContainer(
            childWidget: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.065),
                  Text(
                    'Booking Summary',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.w),
            width: double.infinity,
            color: AppColors.Blueprimary,
            child: Column(
              children: [
                Text('Premium Accelerator', style: TextStyle(fontSize: 13.sp)),
                SizedBox(height: 8.h),
                Text(
                  'Career Growth Package',
                  style: TextStyle(fontSize: 22.sp),
                ),
                SizedBox(height: 8.h),
                Text('250LE', style: TextStyle(fontSize: 28.sp)),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.w),
            child: Column(
              children: [
                Text('What\'s included', style: TextStyle(fontSize: 15.sp)),
                SizedBox(height: 12.h),
                PackageIncludedDetailsRows(),
                PackageIncludedDetailsRows(),
                PackageIncludedDetailsRows(),
                PackageIncludedDetailsRows(),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          ButtonContainer(text: 'Confirm', onTap: () {}),
        ],
      ),
    );
  }
}
