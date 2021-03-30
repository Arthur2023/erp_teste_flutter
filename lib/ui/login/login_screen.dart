import 'package:erp_tela_flutter/app_screen.dart';
import 'package:erp_tela_flutter/shortcuts/_model.dart';
import 'package:erp_tela_flutter/shortcuts/back_focus_node.dart';
import 'package:erp_tela_flutter/shortcuts/enter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  Model model;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Model model;

  final emailkey = GlobalKey<FormFieldState>();
  final passkey = GlobalKey<FormFieldState>();

  final emailController = TextEditingController();
  final passController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  FocusNode buttonFocus = FocusNode();


  @override
  void initState() {
    super.initState();
    List<FocusNode> nodes = [
      emailFocus,
      passFocus,
      buttonFocus,
    ];

    model = Model( nodes, []);
  }




  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          BackFocusScopeIntent: BackFocusScopeAction(model, context),
        },
        child: Focus(
          child: Scaffold(
            body: Stack(children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/blue.jpeg"),
                  fit: BoxFit.fill,
                )),
              ),
              Center(
                child: Container(
                  height: 400,
                  width: 500,
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/logo_precisa.jpg"),
                                    fit: BoxFit.contain)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            focusNode: emailFocus,
                            autofocus: true,
                            onSubmitted: (text){
                              passFocus.requestFocus();
                            },
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: "Email",
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            focusNode: passFocus,
                            controller: passController,
                            decoration: InputDecoration(
                              hintText: "Senha",
                            ),
                            onSubmitted: (text){
                              buttonFocus.requestFocus();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 45,
                            child: ElevatedButton(
                              focusNode: buttonFocus,
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      return Colors.blue[
                                          900]; // Use the component's default.
                                    },
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => AppScreen()));
                                },
                                child: Text(
                                  "Entrar",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
