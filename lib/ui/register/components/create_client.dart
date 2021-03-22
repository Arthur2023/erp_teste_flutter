import 'package:erp_tela_flutter/managers/client_manager.dart';
import 'package:erp_tela_flutter/models/client.dart';
import 'package:erp_tela_flutter/shortcuts/_model.dart';
import 'package:erp_tela_flutter/shortcuts/back_focus_node.dart';
import 'package:erp_tela_flutter/shortcuts/close_actual_context.dart';
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
  final namekey = GlobalKey<FormFieldState>();
  final companykey = GlobalKey<FormFieldState>();
  final phonekey = GlobalKey<FormFieldState>();
  final emailkey = GlobalKey<FormFieldState>();
  final addresskey = GlobalKey<FormFieldState>();
  final test1key = GlobalKey<FormFieldState>();
  final test2key = GlobalKey<FormFieldState>();
  final test3key = GlobalKey<FormFieldState>();

  final nameController = TextEditingController();
  final companyController = TextEditingController();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final test1Controller = TextEditingController();
  final test2Controller = TextEditingController();
  final test3Controller = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode companyFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode dateFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  FocusNode buttonFocus = FocusNode();
  FocusNode test1Focus = FocusNode();
  FocusNode test2Focus = FocusNode();
  FocusNode test3Focus = FocusNode();

  Model model;

  @override
  void initState() {
    super.initState();
    List<FocusNode> nodes = [
      nameFocus,
      companyFocus,
      phoneFocus,
      emailFocus,
      addressFocus,
      buttonFocus,
    ];
    List<FocusNode> nodes2 = [
      test1Focus,
      test2Focus,
      test3Focus,
    ];

    model = Model(nodes , nodes2);
  }

  final Client client = Client("", "", "", "", "");

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.controlLeft):
        const CloseActualContextIntent(),
        LogicalKeySet(LogicalKeyboardKey.escape): const BackFocusScopeIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          CloseActualContextIntent: CloseActualContextAction(model, context),
          BackFocusScopeIntent: BackFocusScopeAction(model, context),
        },
        child: Focus(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 85),
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 22, 12, 25),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "Criação de Cliente",
                            style: TextStyle(
                                color: Colors.blue[900], fontSize: 23),
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
                    const SizedBox(height: 45),
                    TextFormField(
                      key: test3key,
                      focusNode: test3Focus,
                      controller: test3Controller,
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "test3",
                        labelStyle:
                        TextStyle(color: Colors.blue[900]),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      onFieldSubmitted: (text) {
                        test3key.currentState.validate();
                        nameFocus.requestFocus();
                      },
                      validator: (text) {
                        if (text.isEmpty) {
                          return "Campo obrigatório";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 45),
                    Form(
                        key: formkey,
                        child: Column(
                          children: [
                            TextFormField(
                              key: namekey,
                              autofocus: true,
                              focusNode: nameFocus,
                              controller: nameController,
                              decoration: InputDecoration(
                                labelText: "Nome",
                                labelStyle:
                                TextStyle(color: Colors.blue[900]),
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
                                namekey.currentState.validate();
                                if(text != "0"){
                                  companyFocus.requestFocus();}
                                else {test1Focus.requestFocus();}
                              },
                              onSaved: (text) {
                                client.name = text;
                              },
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              key: companykey,
                              focusNode: companyFocus,
                              controller: companyController,
                              decoration: InputDecoration(
                                labelText: "Empresa",
                                labelStyle:
                                TextStyle(color: Colors.blue[900]),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                              onFieldSubmitted: (text) {
                                phoneFocus.requestFocus();
                                companykey.currentState.validate();
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
                              padding:
                              const EdgeInsets.symmetric(vertical: 8),
                              child: TextFormField(
                                key: phonekey,
                                focusNode: phoneFocus,
                                controller: phoneController,
                                decoration: InputDecoration(
                                  labelText: "telefone",
                                  labelStyle:
                                  TextStyle(color: Colors.blue[900]),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                onFieldSubmitted: (text) {
                                  emailFocus.requestFocus();
                                  phonekey.currentState.validate();
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
                              key: emailkey,
                              focusNode: emailFocus,
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: "email",
                                labelStyle:
                                TextStyle(color: Colors.blue[900]),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              onFieldSubmitted: (text) {
                                addressFocus.requestFocus();
                                emailkey.currentState.validate();
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
                              padding:
                              const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                key: addresskey,
                                focusNode: addressFocus,
                                controller: addressController,
                                decoration: InputDecoration(
                                  labelText: "endereço",
                                  labelStyle:
                                  TextStyle(color: Colors.blue[900]),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                onFieldSubmitted: (text) {
                                  addresskey.currentState.validate();
                                  nameFocus.requestFocus();
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
                    const SizedBox(height: 45),
                    TextFormField(
                      key: test1key,
                      focusNode: test1Focus,
                      controller: test1Controller,
                      decoration: InputDecoration(
                        labelText: "test1",
                        labelStyle:
                        TextStyle(color: Colors.blue[900]),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      onFieldSubmitted: (text) {
                        test1key.currentState.validate();
                        test2Focus.requestFocus();
                      },
                      validator: (text) {
                        if (text.isEmpty) {
                          return "Campo obrigatório";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      key: test2key,
                      focusNode: test2Focus,
                      controller: test2Controller,
                      decoration: InputDecoration(
                        labelText: "test2",
                        labelStyle:
                        TextStyle(color: Colors.blue[900]),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      onFieldSubmitted: (text) {
                        test2key.currentState.validate();
                        buttonFocus.requestFocus();
                      },
                      validator: (text) {
                        if (text.isEmpty) {
                          return "Campo obrigatório";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          focusNode: buttonFocus,
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
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
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20)),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
