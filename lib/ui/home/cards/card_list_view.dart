import 'package:flutter/material.dart';

class CardListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Últ. movimentos",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.italic,
                  fontSize: 17,
                ),
              ),
              for (final i in movements)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SizedBox(
                    height: 40,
                    child: Card(
                      color: Colors.blue[800],
                      margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Text(
                            i.name,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            i.value.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                      ],
                    ),
                        )),
                  ),
                ),
            ],
          ),
        ));
  }

  List<Movement> movements = [
    Movement("Shell", 450),
    Movement("Quinta", 700),
    Movement("Shell", 850),
  ];
}

class Movement {
  String name;
  num value;

  Movement(this.name, this.value);
}
