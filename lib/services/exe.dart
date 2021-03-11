import 'dart:convert';
import 'dart:io';

import 'package:process_run/shell.dart';

class Exe{

  exec() async {
    var process = await Process.start('C:\\Users\\hullk\\AppData\\Local\\WhatsApp\\WhatsApp2.exe', []);
    process.stdout
        .transform(utf8.decoder)
        .forEach(print);
    process.stdin.writeln('Hello, world!');
    process.stdin.writeln('Hello, galaxy!');
    process.stdin.writeln('Hello, universe!');
  }

}


//TODO: O Caminho do Start leva ao executável externo;