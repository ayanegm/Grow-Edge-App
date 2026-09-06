import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_edge_app/features/coaches/presentation/widgets/booking_session_details_container.dart';
import 'package:grow_edge_app/widgets/bottom_navigation_bar_widget.dart';
import 'package:grow_edge_app/widgets/button_container.dart';
import 'package:grow_edge_app/widgets/logo_container.dart';

class SessionBookingSummaryPage extends StatelessWidget {
  const SessionBookingSummaryPage({super.key});

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
          Expanded(child: BookingSessionDetailsContainer()),
          ButtonContainer(text: 'Confirm', onTap: () {}),
        ],
      ),
    );
  }
}
