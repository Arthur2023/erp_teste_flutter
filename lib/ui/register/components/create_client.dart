import 'package:flutter/material.dart';

class CreateClient extends StatefulWidget {
  @override
  _CreateClientState createState() => _CreateClientState();
}

class _CreateClientState extends State<CreateClient> {
  final nameController = TextEditingController();
  final companyController = TextEditingController();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 85),
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
              TextField(
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
              ),
              const SizedBox(height: 5),
              TextField(
                controller: companyController,
                decoration: InputDecoration(
                  labelText: "Empresa",
                  labelStyle: TextStyle(color: Colors.blue[900]),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextField(
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
                ),
              ),
              TextField(
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
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
                ),
              ),
              const SizedBox(height: 25),
              const SizedBox(
                height: 60,
                child: ElevatedButton(
                    child: Text("Criar",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  onPressed: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
