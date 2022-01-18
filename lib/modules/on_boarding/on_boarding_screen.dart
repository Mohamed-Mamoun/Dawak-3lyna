import 'package:flutter/material.dart';


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
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModal> boarding = [
    BoardingModal(
      image: 'asset/images/onboarding_1.png',
      title: 'Explore',
      body:
          'Choose Whatever the Product you wish for with the easiest way possible',
    ),
    BoardingModal(
      image: 'asset/images/onboarding_1.png',
      title: 'Shipping',
      body:
          'Yor Order will be shipped to you as fast as possible by our carrier',
    ),
    BoardingModal(
      image: 'asset/images/onboarding_1.png',
      title: 'Make the Payment',
      body: 'Pay with the safest way possible either by cash or credit cards',
    ),
  ];

  bool isLast = false;
  void submit() {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if (value) {
        navigatAndFinish(context, ShopLoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: submit,
            child: Text('SKIP'),
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
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    print('Last');
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    print('not Last');
                    setState(() {
                      isLast = false;
                    });
                  }
                },
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: myColor,
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 4,
                    spacing: 5.0,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      boardController.nextPage(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.decelerate,
                      );
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
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
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            '${modal.body}',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}
