import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/app_textStyles.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  final List<OnboardingItem> _items = [
    OnboardingItem(
        image: 'assets/images/intro.png',
        title: 'Discover latest Trends',
        description:
            'Explore the newest fashion trends and find your unique style'),
    OnboardingItem(
        image: 'assets/images/intro1.png',
        title: 'Quality Products',
        description: 'shop premium quality products from top brands worldwide'),
    OnboardingItem(
        image: 'assets/images/intro2.png',
        title: 'title',
        description: 'simple and secure shopping at your fingertips'),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _items[index].image,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    _items[index].title,
                    textAlign: TextAlign.center,
                    style: AppTextstyles.withcolor(AppTextstyles.h1,
                        Theme.of(context).textTheme.bodyLarge!.color!),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 32), // تم التصحيح هنا
                    child: Text(
                      _items[index].description,
                      textAlign: TextAlign.center,
                      style: AppTextstyles.withcolor(
                        AppTextstyles.h1,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                    ),
                  ),
                ],
              );
            },
            controller: _pageController,
            itemCount: _items.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
          Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      _items.length,
                      (index) => AnimatedContainer(
                          duration: const Duration(microseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: _currentPage == index ? 24 : 8,
                          decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? Theme.of(context).primaryColor
                                  : (isDark
                                      ? Colors.grey[700]
                                      : Colors.grey[300]),
                              borderRadius: BorderRadius.circular(4)))))),
          Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'skip',
                        style: AppTextstyles.withcolor(
                            AppTextstyles.buttunMeduim,
                            isDark ? Colors.grey[400]! : Colors.grey[600]!),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        if (_currentPage < _items.length - 1) {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        } else {
                          // Navigate to next screen
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: Text(
                        _currentPage == _items.length - 1
                            ? 'Get Started'
                            : 'Next',
                      ))
                ],
              ))
        ],
      ),
    );
  }
}

class OnboardingItem {
  final String image;
  final String title;
  final String description;

  OnboardingItem(
      {required this.image, required this.title, required this.description});
}
