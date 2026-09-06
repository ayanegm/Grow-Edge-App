import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_edge_app/features/coaches/data/models/coach_container_model.dart';
import 'package:grow_edge_app/features/coaches/presentation/cubit/coaches_cubit.dart';
import 'package:grow_edge_app/features/coaches/presentation/widgets/about_section_widget.dart';
import 'package:grow_edge_app/features/coaches/presentation/widgets/arease_expertise_widget.dart';
import 'package:grow_edge_app/features/coaches/presentation/widgets/coach_booking_bottom_sheet.dart';
import 'package:grow_edge_app/features/coaches/presentation/widgets/coach_container_profile.dart';
import 'package:grow_edge_app/features/coaches/presentation/widgets/containers_expertise_widget.dart';
import 'package:grow_edge_app/features/coaches/presentation/widgets/next_button.dart';
import 'package:grow_edge_app/features/coaches/presentation/widgets/session_booking_container.dart';
import 'package:grow_edge_app/generated/assets.dart';
import 'package:grow_edge_app/widgets/bottom_navigation_bar_widget.dart';
import 'package:grow_edge_app/widgets/button_container.dart';
import 'package:grow_edge_app/widgets/logo_container.dart';

class CoachProfilePage extends StatelessWidget {
  const CoachProfilePage({super.key, required this.coachId});
  final int coachId;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return BlocProvider(
      create: (context) => CoachesCubit()..getCoachProfile(coachId),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBarWidget(currentIndex: 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LogoContainer(
              childWidget: Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.065),
                    Text(
                      'Profile',
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
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: BlocBuilder<CoachesCubit, CoachesState>(
                  builder: (context, state) {
                    if (state is CoachesLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is CoachProfileSuccess) {
                      final CoachContainerModel profile = state.coachProfile;
                      return Column(
                        children: [
                          CoachContainerProfile(coachModel: profile),

                          AboutSectionWidget(bio: profile.bio),
                          SizedBox(height: 9.h),
                          AreaseExpertiseWidget(),
                          Spacer(),
                          ButtonContainer(
                            text: 'Book Session',
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) =>
                                    const CoachBookingBottomSheet(),
                              );
                            },
                          ),
                        ],
                      );
                    } else if (state is CoachesFailure) {
                      return Center(child: Text(state.message));
                    }
                    return SizedBox();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
