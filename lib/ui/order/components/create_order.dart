import 'package:erp_tela_flutter/managers/client_manager.dart';
import 'package:erp_tela_flutter/models/client.dart';
import 'package:erp_tela_flutter/shortcuts/_model.dart';
import 'package:erp_tela_flutter/shortcuts/back_focus_node.dart';
import 'package:erp_tela_flutter/shortcuts/close_actual_context.dart';
import 'package:erp_tela_flutter/ui/__commons/progress_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CreateOrder extends StatefulWidget {
  @override
  _CreateOrderState createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final userkey = GlobalKey<FormFieldState>();
  final productskey = GlobalKey<FormFieldState>();
  final phonekey = GlobalKey<FormFieldState>();
  final paymentkey = GlobalKey<FormFieldState>();
  final addresskey = GlobalKey<FormFieldState>();

  final userController = TextEditingController();
  final productsController = TextEditingController();
  final phoneController = TextEditingController();
  final paymentController = TextEditingController();
  final addressController = TextEditingController();

  FocusNode userFocus = FocusNode();
  FocusNode productsFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode paymentFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  FocusNode buttonFocus = FocusNode();

  Model model;

  @override
  void initState() {
    super.initState();
    List<FocusNode> nodes = [
      userFocus,
      productsFocus,
      phoneFocus,
      paymentFocus,
      addressFocus,
      buttonFocus,
    ];

    model = Model(nodes, []);
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
                              "Criação de Ordem",
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
                      Form(
                          key: formkey,
                          child: Column(
                            children: [
                              TextFormField(
                                key: userkey,
                                autofocus: true,
                                focusNode: userFocus,
                                controller: userController,
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
                                  productsFocus.requestFocus();
                                  userkey.currentState.validate();
                                },
                                onSaved: (text) {
                                  client.name = text;
                                },
                              ),
                              const SizedBox(height: 5),
                              TextFormField(
                                key: productskey,
                                focusNode: productsFocus,
                                controller: productsController,
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
                                  productskey.currentState.validate();
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
                                    paymentFocus.requestFocus();
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
                                key: paymentkey,
                                focusNode: paymentFocus,
                                controller: paymentController,
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
                                  paymentkey.currentState.validate();
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
      ),
    );
  }
}
