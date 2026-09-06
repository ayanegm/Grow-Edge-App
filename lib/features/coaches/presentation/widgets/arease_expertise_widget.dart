import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_edge_app/features/coaches/presentation/widgets/containers_expertise_widget.dart';

class AreaseExpertiseWidget extends StatelessWidget {
  const AreaseExpertiseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Text('Areas of Expertise', style: TextStyle(fontSize: 15.sp)),
          SizedBox(height: 12.h),
          Wrap(
            spacing:
                8.0, // Horizontal gap between the tags (matches the 8px Gap in Figma)
            runSpacing: 8.0, // Vertical gap between lines when they wrap
            children: [ContainersExpertiseWidget()],
          ),
        ],
      ),
    );
  }
}
