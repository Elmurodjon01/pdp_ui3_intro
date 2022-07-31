import 'package:flutter/material.dart';
import 'package:pdp_ui3_intro/pages/main_screen.dart';
import 'package:pdp_ui3_intro/strings.dart';

import '../constants.dart';

class IntroPage extends StatefulWidget {
  static String id = 'intropage';
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  int pageOrder = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(alignment: Alignment.bottomCenter, children: [
          PageView(
            onPageChanged: (int newIndex) {
              setState(() {
                pageOrder = newIndex;
              });
            },
            controller: _pageController,
            children: [
              myPage(
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent,
                image: 'assets/image_1.png',
              ),
              myPage(
                title: Strings.stepTwoTitle,
                content: Strings.stepTwoContent,
                image: 'assets/image_2.png',
              ),
              myPage(
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
                image: 'assets/image_3.png',
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 180, bottom: 18),
            child: Row(
              children: [
                Row(
                  children: _buildIndicator(),
                ),
                const SizedBox(
                  width: 125,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: skipButton(),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  //pages of PageView widget
  Widget myPage({title, content, image}) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              title,
              style: kTitle,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              content,
              style: kContent,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(image),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (pageOrder == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  Widget skipButton() {
    return pageOrder == 2
        ? GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, HomePage.id);
            },
            child: const Text(
              'Skip',
              style: kSkip,
            ))
        : const Text('');
  }
}

// Container(
// padding: const EdgeInsets.only(left: 180),
// child: Row(
// children: List.generate(3, (newIndex) {
// return Container(
// margin: const EdgeInsets.all(5),
// width: newIndex == 1 ? 6 : 12,
// height: 6,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(5),
// color: Colors.red,
// ),
// );
// }
// ),
// ),
// ),
