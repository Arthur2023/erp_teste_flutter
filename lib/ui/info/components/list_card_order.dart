import 'package:erp_tela_flutter/exes/change_state_order.dart';
import 'package:erp_tela_flutter/managers/app_manager.dart';
import 'package:erp_tela_flutter/models/order.dart';
import 'package:erp_tela_flutter/services/ws_execute.dart';
import 'package:erp_tela_flutter/ui/__commons/progress_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCardOrder extends StatelessWidget {
  final Order order;

  const ListCardOrder(this.order);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          color: Colors.blue[900],
          child: InkWell(
            onTap: () async {
              progressDialog(context);
              Order aux = await ChangeStateOrder().exec(order);
              await WebServiceController().put(
                  query: "/orders/update", body: aux.toMap()).then((value) => print);
              context.read<AppManager>().orderChange = await context.read<AppManager>().getAllOrder();
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        order.price.toString() + " R\$",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(order.status.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    ],
                  ),
                  Text(order.date, style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          )),
    );
  }
}
