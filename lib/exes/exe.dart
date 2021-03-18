import 'dart:io';

class Exe {
  String path =
      "C:\\Users\\hullk\\Desktop\\Precisa Cods\\executable_test_flutter\\build\\windows\\runner\\Release";
  String exe = "executable_test_flutter.exe";
  String response;

  exec(String a) async {
    ProcessResult result = await Process.run(
      path + "\\" + exe,
      [a],
    );
    print(result.stdout);
    response = result.stdout.toString();
  }
}
