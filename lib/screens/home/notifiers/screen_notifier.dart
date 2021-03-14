import 'package:flutter/material.dart';

class ScreenNotifier extends ChangeNotifier {
  PageController pageController = PageController(viewportFraction: 0.55);

  double currentPage = 0;

  ScreenNotifier() {
    this.pageController.addListener(() {
      this.currentPage = pageController.page;

      notifyListeners();
    });
  }
}
