import 'package:flutter/material.dart';


class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int totalTaps = 0;
  final List<String> tasbeehWords = ["الله أكبر", "الحمد لله", "سبحان الله"];
  int index = 0;

  void _onTasbeehTap() {
    setState(() {
      totalTaps++;
      if (counter == 33) {
        counter = 0;
        index = (index + 1) % tasbeehWords.length;
      } else {
        counter++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: Colors.white),
        ), // Text
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              'assets/images/sebha_head.png',
              height: screenSize.height * .14,
            ), // Image.asset
            Container(
              margin: EdgeInsets.only(top: screenSize.height * .13),
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  InkWell(
                    onTap: _onTasbeehTap,
                    child: AnimatedRotation(
                      turns: totalTaps / 33,
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.linear,
                      child: Image.asset(
                        'assets/images/SebhaBody 1.png',
                        height: screenSize.height * .4,
                      ),
                    ),
                  ), // Image.asset
                  Column(
                    spacing: screenSize.height * .02,
                    children: [
                      Text(
                        tasbeehWords[index],
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(color: Colors.white, fontSize: 26),
                      ), // Text
                      Text(
                        '$counter',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(color: Colors.white, fontSize: 26),
                      ), // Text
                    ],
                  ), // Column
                ],
              ), // Stack
            ), // Container
          ],
        ), // Stack
      ],
    );
  }
}
