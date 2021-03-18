import 'file:///C:/Users/hullk/AndroidStudioProjects/erp_tela_flutter/lib/exes/exe.dart';
import 'package:erp_tela_flutter/services/web_service.dart';
import 'package:erp_tela_flutter/ui/__commons/progress_dialogue.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {

  final TextEditingController searchController = TextEditingController();
  final TextEditingController sendController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 150, top: 120, bottom: 50, right: 150),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 2.5,
                          child: Column(
                            children: [
                              Text(
                                "Firebase",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.blue[900]),
                              ),
                              const SizedBox(height: 65),
                              SizedBox(
                                height: 45,
                                width: 260,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text("Pesquisar",
                                        style: TextStyle(fontSize: 18))),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Card(
                            elevation: 2.5,
                            child: Column(
                              children: [
                                Text(
                                  "Web Service",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.blue[900]),
                                ),
                                const SizedBox(height: 65),
                                SizedBox(
                                  height: 45,
                                  width: 260,
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        progressDialog(context);
                                        await WsExecute()
                                            .executeDb(
                                                query:
                                                    "/request/navios?codigoEmpresa=1&uid=SyNw6TB5IqYqNJhOoWdUR93o4Ao2&segmento=1")
                                            .then((value) => searchController
                                                .text = value.toString());
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Pesquisar",
                                          style: TextStyle(fontSize: 18))),
                                ),
                              ],
                            )),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Card(
                            elevation: 2.5,
                            child: Column(
                              children: [
                                Text(
                                  "Executável",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.blue[900]),
                                ),
                                const SizedBox(height: 65),
                                TextField(
                                  controller: sendController,
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                    height: 45,
                                    width: 260,
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          Exe now = Exe();
                                          progressDialog(context);
                                          await now.exec(sendController.text);
                                          searchController.text = now.response;
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Pesquisar",
                                            style: TextStyle(fontSize: 18)))),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Flexible(
                    child: TextFormField(
                  readOnly: true,
                  maxLines: 20,
                  controller: searchController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
