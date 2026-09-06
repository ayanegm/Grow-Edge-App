import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_edge_app/features/coaches/presentation/widgets/info_row_list_booking_summary.dart';
import 'package:grow_edge_app/generated/assets.dart';

class BookingSessionDetailsContainer extends StatelessWidget {
  const BookingSessionDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12),
          color: Colors.white,
          child: Row(
            children: [
              Image.asset(Assets.assetsImagesMale, height: 44.h, width: 44.w),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  children: [
                    Text('Wael El-Qsaby', style: TextStyle(fontSize: 15.sp)),
                    SizedBox(height: 4.h),
                    Text(
                      'Life Coaching · Career Coaching',
                      style: TextStyle(fontSize: 11.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          color: Colors.white,
          child: Column(
            children: [
              Text('Booking Specification', style: TextStyle(fontSize: 15.sp)),
              SizedBox(height: 12.h),
              InfoRowListBookingSummary(),
              InfoRowListBookingSummary(),

              InfoRowListBookingSummary(),

              InfoRowListBookingSummary(),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          color: Colors.white,
          child: Column(
            children: [
              InfoRowListBookingSummary(),
              InfoRowListBookingSummary(),
              InfoRowListBookingSummary(),
            ],
          ),
        ),
      ],
    );
  }
}
