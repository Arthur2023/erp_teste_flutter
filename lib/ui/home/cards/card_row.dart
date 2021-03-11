import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Text1",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 9, bottom: 9, right: 130),
                      child: Text(
                        "000,00 R\$",
                        style: TextStyle(
                            color: Colors.blue[1000],
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                    Text(
                      "+ 10%",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                color: Colors.grey[400],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Text2",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 9, bottom: 9, right: 130),
                      child: Text(
                        "000,00 R\$",
                        style: TextStyle(
                            color: Colors.blue[1000],
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                    Text(
                      "+ 10%",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                color: Colors.grey[400],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Text3",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 9, bottom: 9, right: 130),
                      child: Text(
                        "000,00 R\$",
                        style: TextStyle(
                            color: Colors.blue[1000],
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                    Text(
                      "- 10%",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                color: Colors.grey[400],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Text4",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 9, bottom: 9),
                      child: Text(
                        "000,00 R\$",
                        style: TextStyle(
                            color: Colors.blue[1000],
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                    Text(
                      "+ 10%",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
