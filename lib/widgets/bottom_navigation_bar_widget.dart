import 'package:flutter/material.dart';
import 'package:grow_edge_app/constants/app_colors.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const BottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;

    return Container(
      height: screenHeight * 0.108,
      padding: EdgeInsets.only(
        top: screenHeight * 0.005,
        bottom: screenHeight * 0.007,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE5E7EB), width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            context,
            index: 0,
            icon: Icons.home_outlined,
            label: 'Home',
          ),
          _buildNavItem(
            context,
            index: 1,
            icon: Icons.person_outline,
            label: 'coaches',
          ),
          _buildNavItem(
            context,
            index: 2,
            icon: Icons.work_outline,
            label: 'Internships',
          ),
          _buildNavItem(
            context,
            index: 3,
            icon: Icons.work_outline,
            label: 'MVP Lap',
          ),
          _buildNavItem(context, index: 4, icon: Icons.apps, label: 'More'),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required int index,
    required IconData icon,
    required String label,
  }) {
    final bool isSelected = currentIndex == index;
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Expanded(
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!(index);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: screenHeight * 0.0036,
              width: screenWidth * 0.058,
              margin: EdgeInsets.only(bottom: screenHeight * 0.01),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green : Colors.transparent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Icon(
              icon,
              size: screenWidth * 0.058,
              color: isSelected ? Colors.green : AppColors.lightGray,
            ),
            SizedBox(height: screenHeight * 0.005),
            Text(
              label,
              style: TextStyle(
                fontSize: screenWidth * 0.027,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                color: isSelected ? AppColors.Blueprimary : AppColors.lightGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
