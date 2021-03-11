import 'package:erp_tela_flutter/services/exe.dart';
import 'package:erp_tela_flutter/services/web_service.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container(
        //   decoration: BoxDecoration(
        //       image: DecorationImage(
        //     image: AssetImage("assets/images/blue.jpeg"),
        //     fit: BoxFit.fill,
        //   )),
        // ),
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
                                      onPressed: () {
                                        WsExecute()
                                            .executeDb(
                                                query:
                                                    "/request/navios?codigoEmpresa=1&uid=SyNw6TB5IqYqNJhOoWdUR93o4Ao2&segmento=1")
                                            .then((value) => searchController
                                                .text = value.toString());
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
                                SizedBox(
                                    height: 45,
                                    width: 260,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Exe().exec();
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
