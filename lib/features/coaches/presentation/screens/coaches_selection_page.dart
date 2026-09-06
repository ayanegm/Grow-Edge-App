import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_edge_app/constants/app_colors.dart';
import 'package:grow_edge_app/features/coaches/presentation/cubit/coaches_cubit.dart';
import 'package:grow_edge_app/features/coaches/presentation/screens/coach_profile_page.dart';
import 'package:grow_edge_app/features/coaches/presentation/widgets/coach_container.dart';
import 'package:grow_edge_app/widgets/bottom_navigation_bar_widget.dart';
import 'package:grow_edge_app/widgets/search_text_field.dart';
import 'package:grow_edge_app/widgets/logo_container.dart';

class CoachesSelectionPage extends StatelessWidget {
  CoachesSelectionPage({super.key});

  final TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return BlocProvider(
      create: (context) => CoachesCubit()..getCoaches(),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBarWidget(currentIndex: 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                      'Coaches',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: screenWidth * 0.055,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.01),
                    SearchTextField(
                      controller: searchText,
                      hintText: 'Wael El-Qasaby',
                    ),
                    SizedBox(height: screenHeight * 0.010),
                    Expanded(
                      child: BlocBuilder<CoachesCubit, CoachesState>(
                        builder: (context, state) {
                          if (state is CoachesLoading) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is CoachesSuccess) {
                            final coaches = state.coaches;
                            if (coaches.isEmpty) {
                              return Center(child: Text('No coaches found'));
                            }

                            return ListView.builder(
                              itemCount: coaches.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CoachProfilePage(
                                                  coachId: coaches[index].id!,
                                                ),
                                          ),
                                        );
                                      },
                                      child: CoachContainer(
                                        coachModel: coaches[index],
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.0147),
                                  ],
                                );
                              },
                            );
                          } else if (state is CoachesFailure) {
                            return Center(child: Text(state.message));
                          }
                          return SizedBox();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
