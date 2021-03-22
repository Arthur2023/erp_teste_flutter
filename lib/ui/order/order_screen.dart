import 'package:erp_tela_flutter/managers/app_manager.dart';
import 'package:erp_tela_flutter/shortcuts/_model.dart';
import 'package:erp_tela_flutter/shortcuts/open_create_order.dart';
import 'package:erp_tela_flutter/ui/info/components/list_card_order.dart';
import 'package:erp_tela_flutter/ui/order/components/create_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  Model model = Model([], []);

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.keyC): const OpenCreateOrderIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          OpenCreateOrderIntent: OpenCreateOrderAction(model, context),
        },
        child: Focus(
          autofocus: true,
          child: Stack(
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
                            style: TextStyle(
                                color: Colors.blue[900], fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 25),
                          for (final order
                              in context.watch<AppManager>().orders)
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
                            IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context2) => CreateOrder());
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
