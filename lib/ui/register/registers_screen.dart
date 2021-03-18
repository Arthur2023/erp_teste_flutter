import 'package:erp_tela_flutter/ui/register/components/create_client.dart';

import 'components/client_dialogue.dart';
import 'file:///C:/Users/hullk/AndroidStudioProjects/erp_tela_flutter/lib/ui/__commons/generic_dialogue.dart';
import 'file:///C:/Users/hullk/AndroidStudioProjects/erp_tela_flutter/lib/exes/select_client.dart';
import 'package:erp_tela_flutter/models/client.dart';
import 'package:erp_tela_flutter/ui/__commons/progress_dialogue.dart';
import 'package:provider/provider.dart';
import 'package:erp_tela_flutter/managers/client_manager.dart';
import 'package:flutter/material.dart';

class RegistersScreen extends StatelessWidget {
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
            width: 875,
            child: Card(
              elevation: 2.5,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Clientes",
                      style: TextStyle(color: Colors.blue[900], fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    for (final client in context.watch<ClientManager>().clients)
                      SizedBox(
                        height: 60,
                        child: Card(
                          color: Colors.blue[900],
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context2) => ClientDialogue(client),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    client.name,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Text(
                                    client.company,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
            left: 960,
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
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context2) => GenericDialog(
                                title: "Registro",
                                contentText: "O que deseja criar?",
                                submitButtonText: "Criar",
                                submitButtonColor: Colors.green[700],
                                onSubmit: () {},
                                color: Colors.blue[900],
                                content: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 50, horizontal: 20),
                                  child: Row(
                                    children: [
                                      Column(children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons
                                                .supervised_user_circle_outlined,
                                            color: Colors.white,
                                          ),
                                          onPressed: () async {
                                            progressDialog(context);
                                            SelectClient newClient =
                                                SelectClient();
                                            Client client =
                                                await newClient.exec();
                                            print(client);
                                            context
                                                .read<ClientManager>()
                                                .add(client);
                                            print("SUCESSO");
                                            print(context
                                                .read<ClientManager>()
                                                .clients);
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        Text(
                                          "Cliente",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ]),
                                      VerticalDivider(
                                        color: Colors.white,
                                        width: 40,
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.polymer_rounded,
                                              color: Colors.white,
                                            ),
                                            onPressed: (){},
                                          ),
                                          Text(
                                            "Produto",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      VerticalDivider(
                                        color: Colors.white,
                                        width: 40,
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.face,
                                              color: Colors.white,
                                            ),
                                            onPressed: (){},
                                          ),
                                          Text(
                                            "Fornecedor",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.add, color: Colors.white),
                          onPressed: (){
                            showDialog(
                                context: context,
                                builder: (context2) => CreateClient());
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.settings, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Divider(),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
