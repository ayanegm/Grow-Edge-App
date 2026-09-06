import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_edge_app/features/coaches/presentation/widgets/next_button.dart';
import 'package:grow_edge_app/features/coaches/presentation/widgets/session_booking_container.dart';

class CoachBookingBottomSheet extends StatelessWidget {
  const CoachBookingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Booking Options',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, size: 24),
              ),
            ],
          ),
          const SessionBookingContainer(),
          SizedBox(height: 12.h),
          const SessionBookingContainer(),
          SizedBox(height: 24.h),
          const NextButton(),
        ],
      ),
    );
  }
}
