import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CardCentral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2.5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SfCartesianChart(series: <ChartSeries>[
            LineSeries<SalesData, num>(
                dataSource: chartData,
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.value),
          ]),
        ));
  }

  final List<SalesData> chartData = [
    SalesData(2010, 35),
    SalesData(2011, 28),
    SalesData(2012, 34),
    SalesData(2013, 32),
    SalesData(2014, 40)
  ];
}

class SalesData {
  num year;
  num value;

  SalesData(this.year, this.value);
}
