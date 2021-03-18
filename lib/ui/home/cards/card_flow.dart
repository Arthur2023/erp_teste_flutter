import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CardFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.5,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SfCartesianChart(
            title: ChartTitle(
              text: 'Vendas',
              alignment: ChartAlignment.center,
              textStyle: TextStyle(
                color: Colors.grey[700],
                fontFamily: 'Roboto',
                fontStyle: FontStyle.italic,
                fontSize: 14,
              ),
            ),
          isTransposed: true,
            series: <ChartSeries>[
              // Renders bar chart
              BarSeries<SalesData, num>(
                 color: Colors.blue[800],
                  dataSource: chartData,
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.value
              )
            ]
        ),
        ),
      );
  }
  final List<SalesData> chartData = [
    SalesData(2010, 35),
    SalesData(2011, 28),
    SalesData(2012, 34),
    SalesData(2013, 32),
    SalesData(2014, 40),
    SalesData(2015, 48),
    SalesData(2016, 50),
    SalesData(2017, 51),
  ];
}

class SalesData {
  num year;
  num value;

  SalesData(this.year, this.value);
}
