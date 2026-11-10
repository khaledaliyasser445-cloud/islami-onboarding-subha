import 'package:flutter/material.dart';
import 'package:islami_c20_dokki/models/on_boarding_model.dart';
import 'package:islami_c20_dokki/screens/home/home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const String routeName = 'on_boarding_screen';
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void goToNextPage() {
    if (currentIndex < onBoardingScreens.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
  }

  void goToPreviousPage() {
    if (currentIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  List<OnBoardingModel> onBoardingScreens = [
    OnBoardingModel(
      image: 'assets/images/welcome 1.png',
      title: 'Welcome To Islmi App',
    ),
    OnBoardingModel(
      image: 'assets/images/welcome 2.png',
      title: 'Welcome To Islami',
      description: 'We Are Very Excited To Have You In Our Community',
    ),
    OnBoardingModel(
      image: 'assets/images/welcome 3 (1).png',
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    OnBoardingModel(
      image: 'assets/images/welcome 4.png',
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),
    OnBoardingModel(
      image: 'assets/images/welcome 5.png',
      title: 'Holy Quran Radio',
      description: 'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('assets/images/img_header.png', width: 300),
            Expanded(
              child: PageView.builder(
                itemCount: onBoardingScreens.length,
                controller: pageController,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final page = onBoardingScreens[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Image.asset(page.image)),
                      Text(
                        page.title,
                        style: const TextStyle(
                          color: Color(0xFFE2BE7F),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (page.description != null) ...[
                        const SizedBox(height: 12),
                        Text(
                          page.description!,
                          style: const TextStyle(color: Color(0xFFE2BE7F)),
                          textAlign: TextAlign.center,
                        ),
                      ],
                      const SizedBox(height: 24),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: currentIndex > 0 ? goToPreviousPage : null,
                  child: Text(
                    currentIndex != 0 ? 'Back' : '',
                    style: const TextStyle(
                      color: Color(0xFFE2BE7F),
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  children: List.generate(
                    onBoardingScreens.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: currentIndex == index ? 12 : 5,
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? const Color(0xFFE2BE7F)
                            : Colors.white38,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: goToNextPage,
                  child: Text(
                    currentIndex != onBoardingScreens.length - 1 ? 'next' : 'finish',
                    style: const TextStyle(
                      color: Color(0xFFE2BE7F),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
