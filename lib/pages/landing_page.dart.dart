import 'package:flutter/material.dart';
import 'package:grow_edge_app/models/on_boarding_page_data.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    List<OnBoardingPageData> data = [
      OnBoardingPageData(
        progressPhoto: "assets/images/Progress Container 1.png",
        title: "Every Success Starts with a Step",
        subTitle:
            "Start exploring opportunities that help you build a clear career path aligned with your goals and aspirations.",
        imagePath: "assets/images/boy_fist_page.png",
      ),
      OnBoardingPageData(
        progressPhoto: "assets/images/Progress Container 2.png",
        title: "Learn from Industry Experts",
        subTitle:
            "Connect with experienced coaches who provide the guidance and insights you need to make confident career decisions",
        imagePath: "assets/images/Background image 2.png",
      ),
      OnBoardingPageData(
        progressPhoto: "assets/images/Progress Container 3.png",
        title: "Turn Knowledge into Experience",
        subTitle:
            "Discover internship opportunities that help you develop practical skills and gain real-world experience.",
        imagePath: "assets/images/Background image 3.png",
      ),
    ];
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_image 1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),

            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 60,
                    height: 27.12,
                  ),
                  Image.asset(
                    'assets/images/Language Button.png',
                    width: 56,
                    height: 36,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView.builder(
                    controller: _pageController,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final pageData = data[index];
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              horizontal: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  pageData.title,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  pageData.subTitle,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Image.asset(
                                  pageData.progressPhoto,
                                  width: 56,
                                  height: 20,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 16),

                          Expanded(
                            child: SizedBox.expand(
                              child: Image.asset(
                                pageData.imagePath,
                                fit: BoxFit
                                    .cover, // Stretches and expands the image to fill the area
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Positioned(
                    bottom: 12,
                    child: GestureDetector(
                      onTap: () {
                        if (currentPage < data.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Text('there is no more pages');
                        }
                      },
                      child: Image.asset(
                        'assets/images/Next Button.png',
                        width: 141,
                        height: 44,
                      ),
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
