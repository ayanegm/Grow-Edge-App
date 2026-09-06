import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_edge_app/features/coaches/presentation/screens/session_booking_summary_page.dart';
import 'package:grow_edge_app/features/coaches/presentation/widgets/session_booking_container.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SessionBookingSummaryPage();
            },
          ),
        );
      },
      child: Container(
        color: Colors.amberAccent,
        height: 44.h,
        width: double.infinity,
        child: Center(
          child: Text('Next', style: TextStyle(fontSize: 13.sp)),
        ),
      ),
    );
  }
}
