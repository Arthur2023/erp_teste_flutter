import 'package:erp_tela_flutter/models/client.dart';
import 'package:flutter/material.dart';

class ClientDialogue extends StatefulWidget {

  final Client client;

  const ClientDialogue(this.client);

  @override
  _ClientDialogueState createState() => _ClientDialogueState(client);
}

class _ClientDialogueState extends State<ClientDialogue> {
  final Client client;

  final nameController = TextEditingController();
  final companyController = TextEditingController();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  _ClientDialogueState(this.client);

  @override
  void initState() {
    super.initState();
    nameController.text = client.name;
    companyController.text = client.company;
    phoneController.text = client.phone;
    emailController.text = client.email;
    addressController.text = client.address;
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:200, vertical:85),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 22, 12, 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      "Client",
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
              TextField(
                controller: nameController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(color: Colors.blue[900]),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: companyController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Empresa",
                  labelStyle: TextStyle(color: Colors.blue[900]),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextField(
                  controller: phoneController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "telefone",
                    labelStyle: TextStyle(color: Colors.blue[900]),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              TextField(
                controller: emailController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "email",
                  labelStyle: TextStyle(color: Colors.blue[900]),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: addressController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "endereço",
                    labelStyle: TextStyle(color: Colors.blue[900]),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
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
