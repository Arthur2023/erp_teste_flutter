import 'package:erp_tela_flutter/exes/my_app.dart';
import 'package:erp_tela_flutter/models/order.dart';
import 'package:erp_tela_flutter/services/ws_execute.dart';
import 'package:flutter/material.dart';

class AppManager extends ChangeNotifier {
  AppManager() {
    getAllOrder().then((value) {
      orders = value;
      notifyListeners();
    });
  }

  PageController pageController = PageController();

  List<Order> orders = [];

  void set orderChange(List<Order> orderss){
    orders = orderss;
    notifyListeners();
  }

  Future<List<Order>> getAllOrder() async {
    try {
      List<Order> values = [];

      Map<String, dynamic> result = await WebServiceController().get(query: "/orders/getAllFromUser?uid=nx4EKwkov7cxvS7AmbEss5Gd0Vy1");

      if (result != null) {
        if (!result.containsKey("error") && !result.containsKey("connection")) {
          List maps = result["orders"] as List;

          maps.forEach((element) => values.add(Order.fromMap(element)));

          return values;
        }
      }
      throw Exception();
    } catch (e) {
      print(e);
      return null;
    }
  }

  void jumpToPage(int page) {
    pageController.jumpToPage(page);
    print("PAGE $page");
    print("PAGE Controler ${pageController.page}");
    notifyListeners();
  }
}
