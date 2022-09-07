import 'package:dawak_3lyna/modules/mainPage/main_page_screen.dart';
import 'package:dawak_3lyna/shared/components/components.dart';
import 'package:dawak_3lyna/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/network/local/cache_helper.dart';

class BoardingModal {
  final String image;
  final String title;
  final String body;

  BoardingModal({
    @required this.image,
    @required this.body,
    @required this.title,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModal> boarding = [
    BoardingModal(
      image: 'assets/images/img1.jpg',
      title: "الرعاية الصحية ",
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ligula neque, vehicula eget semper sit amet',
    ),
    BoardingModal(
      image: 'assets/images/img2.jpg',
      title: "الدواء",
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ligula neque, vehicula eget semper sit amet',
    ),
    BoardingModal(
      image: 'assets/images/img3.jpg',
      title: " استشارة عبر الإنترنت",
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ligula neque, vehicula eget semper sit amet',
    ),
  ];

  bool isLast = false;
  void submit() {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if (value) {
        navigatAndFinish(context, const MainPageScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          defaultTextButton(
            function: () {
              submit();
            },
            text: 'تخطى',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: myColor,
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 4,
                    spacing: 5.0,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: myColor,
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      boardController.nextPage(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.decelerate,
                      );
                    }
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModal modal) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${modal.image}'),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            '${modal.title}',
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            '${modal.body}',
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}
