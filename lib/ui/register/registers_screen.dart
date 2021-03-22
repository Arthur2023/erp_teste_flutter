import 'package:erp_tela_flutter/exes/select_client.dart';
import 'package:erp_tela_flutter/managers/client_manager.dart';
import 'package:erp_tela_flutter/models/client.dart';
import 'package:erp_tela_flutter/shortcuts/_model.dart';
import 'package:erp_tela_flutter/shortcuts/open_create_client.dart';
import 'package:erp_tela_flutter/ui/__commons/progress_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'components/client_dialogue.dart';
import 'components/create_client.dart';

class RegistersScreen extends StatefulWidget {
  @override
  _RegistersScreenState createState() => _RegistersScreenState();
}

class _RegistersScreenState extends State<RegistersScreen> {
  Model model = Model([] , []);

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.keyC):
        OpenCreateClientIntent(),
      },
      child: Actions(
          actions: <Type, Action<Intent>>{
            OpenCreateClientIntent: OpenCreateClientAction(model, context),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Clientes",
                            style: TextStyle(
                                color: Colors.blue[900], fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          for (final client
                              in context.watch<ClientManager>().clients)
                            SizedBox(
                              height: 60,
                              child: Card(
                                color: Colors.blue[900],
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context2) =>
                                          ClientDialogue(client),
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
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          client.company,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
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
                              onPressed: () async {
                                progressDialog(context);
                                SelectClient newClient = SelectClient();
                                Client client = await newClient.exec();
                                if (client == null) {
                                  Navigator.pop(context);
                                  return null;
                                }
                                context.read<ClientManager>().add(client);
                                print("SUCESSO");
                                print(context.read<ClientManager>().clients);
                                Navigator.pop(context);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.add, color: Colors.white),
                              onPressed: () {
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
