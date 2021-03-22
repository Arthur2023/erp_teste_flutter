import 'package:erp_tela_flutter/app_screen.dart';
import 'package:erp_tela_flutter/shortcuts/_model.dart';
import 'package:erp_tela_flutter/shortcuts/enter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  Model model;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Model model = Model([], []);

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.enter): const enterIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          enterIntent: enterAction(model, context),
        },
        child: Focus(
          autofocus: true,
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
                            decoration: InputDecoration(
                              hintText: "Email",
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Senha",
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 45,
                            child: ElevatedButton(
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
