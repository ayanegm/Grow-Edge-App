import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grow_edge_app/constants/app_colors.dart';
import 'package:grow_edge_app/features/coaches/presentation/widgets/coach_container.dart';
import 'package:grow_edge_app/widgets/search_text_field.dart';
import 'package:grow_edge_app/features/home/presentation/widgets/section_header.dart';
import 'package:grow_edge_app/features/home/presentation/widgets/see_all_button.dart';
import 'package:grow_edge_app/features/home/presentation/widgets/status_container.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchText = TextEditingController();
  final myitems = [
    Image.asset('assets/images/image 29.png'),
    Image.asset('assets/images/splash_background.png'),
  ];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/images/Image.png', height: 44, width: 44),
                SizedBox(width: 12),

                Column(
                  children: [
                    Text(
                      'Good Morning, Ahmed 👋',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'What would you like to do today?',
                      style: TextStyle(
                        color: AppColors.lightGray,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 57),
                Image.asset(
                  'assets/images/Notification Icon.png',
                  width: 24,
                  height: 24,
                ),
              ],
            ),
            SizedBox(height: 16),
            SearchTextField(controller: searchText),
            SizedBox(height: 24),
            CarouselSlider(
              items: myitems,
              options: CarouselOptions(
                autoPlay: true,
                height: 200,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayInterval: Duration(seconds: 2),
                enlargeCenterPage: true,
                aspectRatio: 2,

                onPageChanged: (index, reason) {
                  setState(() {
                    current = index;
                  });
                },
              ),
            ),
            AnimatedSmoothIndicator(
              activeIndex: current,
              count: myitems.length,
              effect: WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                dotColor: Colors.grey,
                activeDotColor: Colors.amber,
                spacing: 5,
                paintStyle: PaintingStyle.fill,
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SectionHeader(title: 'Featured Coaches'),
                SeeAllButton(),
              ],
            ),
            SizedBox(height: 16),
            // CoachContainer(),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SectionHeader(title: 'Internship Opportunities'),
                SeeAllButton(),
              ],
            ),
            SizedBox(height: 16),
            Container(
              height: 155,
              width: 343,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 9),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/Grow Digital.png',
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(width: 8),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 194,
                            height: 17,
                            child: Text(
                              'Grow Digital',
                              style: TextStyle(
                                color: Color(0xFF212529),

                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            width: 194,
                            height: 15,
                            child: Text(
                              'Egypt, Cairo',
                              style: TextStyle(
                                color: AppColors.lightGray,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 4),
                      StatusContainer(text: 'Hybrid'),
                      SizedBox(width: 4),
                      // StatusContainer(text: 'Hybrid'),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Solution Architect Intern',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 17,
                    width: 145,
                    child: Row(
                      children: [
                        Text(
                          '10 weeks',
                          style: TextStyle(
                            color: AppColors.Blueprimary,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 6),
                        Container(
                          width: 3,
                          height: 3,
                          color: Color(0xFFDEE2E6),
                        ),
                        SizedBox(width: 6),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
