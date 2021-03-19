import 'package:erp_tela_flutter/managers/app_manager.dart';
import 'package:erp_tela_flutter/ui/info/components/list_card_order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 75,
          top: 20,
          child: Container(
            color: Colors.white,
            height: 590,
            width: 975,
            child: Card(
              elevation: 2.5,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    Text(
                      "Pedidos  do cliente:",
                      style: TextStyle(color: Colors.blue[900], fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    for(final order in context.watch<AppManager>().orders)
                      ListCardOrder(order),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 1060,
          top: 20,
          child: Container(
            color: Colors.white,
            height: 590,
            width: 280,
            child: Card(
              elevation: 2.5,
              color: Colors.blue[900],
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
