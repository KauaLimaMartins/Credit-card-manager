import 'dart:math';

import 'package:credit_card_manager/models/credit_card.dart';
import 'package:credit_card_manager/screens/details/details_screen.dart';
import 'package:credit_card_manager/screens/home/widgets/balance_widget.dart';
import 'package:credit_card_manager/screens/home/widgets/home_header_widget.dart';
import 'package:credit_card_manager/size_config.dart';
import 'package:credit_card_manager/widgets/card/front_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController(viewportFraction: 0.55);

  int _previousIndex = 0;
  int _currentIndex = 0;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: SizeConfig.defaultHeight * 4,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeaderWidget(),
            BalanceWidget(
              previousIndex: _previousIndex,
              currentIndex: _currentIndex,
            ),
            _buildCardsList(),
            _buildPageIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardsList() {
    return Expanded(
      child: Transform(
        transform: Matrix4.identity()
          ..translate(-SizeConfig.defaultWidth)
          ..rotateZ(-pi / 2),
        alignment: Alignment.center,
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: this.pageController,
          onPageChanged: (index) => setState(() {
            this._previousIndex = this._currentIndex;
            this._currentIndex = index;
          }),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      card: cards[index],
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.only(bottom: SizeConfig.defaultHeight * 5),
                child: FrontCardWidget(
                  card: cards[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.defaultWidth * 2,
        vertical: SizeConfig.defaultHeight * 2,
      ),
      child: SmoothPageIndicator(
        controller: this.pageController,
        count: cards.length,
        effect: WormEffect(
          dotHeight: SizeConfig.defaultHeight,
          dotWidth: SizeConfig.defaultHeight,
          dotColor: Colors.grey[800],
          activeDotColor: Colors.white,
        ),
      ),
    );
  }
}
