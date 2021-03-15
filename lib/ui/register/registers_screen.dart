import 'file:///C:/Users/hullk/AndroidStudioProjects/erp_tela_flutter/lib/ui/__commons/generic_dialogue.dart';
import 'package:flutter/cupertino.dart';
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
                ))),
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
                            Icons.add,
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
                          icon: Icon(Icons.search, color: Colors.white),
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
