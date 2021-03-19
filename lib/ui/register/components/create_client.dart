

import 'package:erp_tela_flutter/managers/client_manager.dart';
import 'package:erp_tela_flutter/models/client.dart';
import 'package:erp_tela_flutter/ui/__commons/progress_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CreateClient extends StatefulWidget {
  @override
  _CreateClientState createState() => _CreateClientState();
}

class _CreateClientState extends State<CreateClient> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final companyController = TextEditingController();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode companyFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode dateFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode addressFocus = FocusNode();

  final Client client = Client("", "", "", "", "");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 85),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 22, 12, 25),
          child: Shortcuts(

            shortcuts: <LogicalKeySet, Intent>{
          // LogicalKeySet(LogicalKeyboardKey.escape): KeyboardEvent(type),
          },

            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Criação de Cliente",
                        style: TextStyle(color: Colors.blue[900], fontSize: 23),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.blue[900],
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Divider(),
                Form(
                    key: formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          focusNode: nameFocus,
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: "Nome",
                            labelStyle: TextStyle(color: Colors.blue[900]),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          validator: (text) {
                            if (text.isEmpty) {
                              return "Campo obrigatório";
                            }
                            return null;
                          },
                          onFieldSubmitted: (text) {
                            companyFocus.requestFocus();
                          },
                          onSaved: (text) {
                            client.name = text;
                          },
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          focusNode: companyFocus,
                          controller: companyController,
                          decoration: InputDecoration(
                            labelText: "Empresa",
                            labelStyle: TextStyle(color: Colors.blue[900]),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          onFieldSubmitted: (text) {
                            phoneFocus.requestFocus();
                          },
                          validator: (text) {
                            if (text.isEmpty) {
                              return "Campo obrigatório";
                            }
                            return null;
                          },
                          onSaved: (text) {
                            client.company = text;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                            focusNode: phoneFocus,
                            controller: phoneController,
                            decoration: InputDecoration(
                              labelText: "telefone",
                              labelStyle: TextStyle(color: Colors.blue[900]),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            onFieldSubmitted: (text) {
                              emailFocus.requestFocus();
                            },
                            validator: (text) {
                              if (text.isEmpty) {
                                return "Campo obrigatório";
                              }
                              return null;
                            },
                            onSaved: (text) {
                              client.phone = text;
                            },
                          ),
                        ),
                        TextFormField(
                          focusNode: emailFocus,
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "email",
                            labelStyle: TextStyle(color: Colors.blue[900]),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          onFieldSubmitted: (text) {
                            addressFocus.requestFocus();
                          },
                          validator: (text) {
                            if (text.isEmpty) {
                              return "Campo obrigatório";
                            }
                            return null;
                          },
                          onSaved: (text) {
                            client.email = text;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextFormField(
                            focusNode: addressFocus,
                            controller: addressController,
                            decoration: InputDecoration(
                              labelText: "endereço",
                              labelStyle: TextStyle(color: Colors.blue[900]),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            onFieldSubmitted: (text) {
                              FocusScope.of(context).previousFocus();
                            },
                            validator: (text) {
                              if (text.isEmpty) {
                                return "Campo obrigatório";
                              }
                              return null;
                            },
                            onSaved: (text) {
                              client.address = text;
                            },
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 25),
                SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            return Colors.blue[900];
                          },
                        ),
                      ),
                      onPressed: () async {
                        if (!formkey.currentState.validate()) return;
                        progressDialog(context);
                        formkey.currentState.save();
                        await context.read<ClientManager>().add(client);
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: Text("Criar",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
