import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_edge_app/constants/app_colors.dart';
import 'package:grow_edge_app/generated/assets.dart';

class SessionBookingContainer extends StatefulWidget {
  const SessionBookingContainer({super.key});

  @override
  State<SessionBookingContainer> createState() =>
      _SessionBookingContainerState();
}

class _SessionBookingContainerState extends State<SessionBookingContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFFDEE2E6), width: 1.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      height: 140.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(Assets.sessionImage, height: 72.h, width: 72.h),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Single Seesion', style: TextStyle(fontSize: 15.sp)),
                    Text('190L.E', style: TextStyle(fontSize: 17.sp)),
                  ],
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: Text(
                    'Ideal for urgent career consultation, interview prep, or quick strategic mapping (30 or 60 mins).',
                    style: TextStyle(fontSize: 10.sp),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: AppColors.lightGray,
                      height: 21.h,
                      width: 44.w,
                      child: Text('1-on-1', style: TextStyle(fontSize: 11.sp)),
                    ),
                    Text(
                      'Available this week',
                      style: TextStyle(fontSize: 11.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
