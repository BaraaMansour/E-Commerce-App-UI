import 'package:flutter/material.dart';

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
          )
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
