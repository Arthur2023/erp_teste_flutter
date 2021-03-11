import 'package:flutter/material.dart';

class AppManager extends ChangeNotifier{
  PageController pageController = PageController();

  void jumpToPage(int page){
    pageController.jumpToPage(page);
    print("PAGE $page");
    print("PAGE Controler ${pageController.page}");
    notifyListeners();
  }
}