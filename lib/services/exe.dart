import 'dart:convert';
import 'dart:io';

class Exe {
  String path =
      "C:\\Users\\hullk\\Desktop\\Precisa Cods\\executable_test_flutter\\build\\windows\\runner\\Debug";
  String exe = "executable_test_flutter.exe";

  exec() async {
    //   ProcessResult process =
    //   Process.runSync(
    //     path + "\\\\" + exe,
    //     [],
    //     workingDirectory: path,
    //   );
    //   Stream<List<String>> stdout;
    //   process.stdout
    //       .transform(utf8.decoder)
    //       .forEach(print);
    //   print('\\n\\n\\n\\n\\n\\n #########################################');
    //   print(process.toString());
    //   print('\\n\\n\\n\\n\\n');
    // }
    Process.start(path + "\\" + exe, []).then((process) {
      stdout.addStream(process.stdout);
      stderr.addStream(process.stderr);
      process.exitCode.then(print);
      print('\n\n\n\n\n\n #########################################');
    });
  }
}



//TODO: O Caminho do Start leva ao executável externo;
