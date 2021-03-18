
import 'package:erp_tela_flutter/models/client.dart';
import 'package:flutter/material.dart';

class ClientManager extends ChangeNotifier {

  List<Client> clients = [];

  add (Client c){

    clients.add(c);
    notifyListeners();

  }




}