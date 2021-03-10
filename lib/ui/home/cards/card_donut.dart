import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CardDonut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.5,
      child: SfCircularChart(
          title: ChartTitle(
              text: 'Materiais',
              alignment: ChartAlignment.center,
              textStyle: ChartTextStyle(
                color: Colors.grey[700],
                fontFamily: 'Roboto',
                fontStyle: FontStyle.italic,
                fontSize: 14,
              ),
          ),
          series: <CircularSeries>[
            DoughnutSeries<ChartData, String>(
                dataSource: chartData,
                pointColorMapper:(ChartData data,  _) => data.color,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y
            )
          ]
      )
    );
  }

  final List<ChartData> chartData = [
    ChartData('David', 25, Colors.blue[800]),
    ChartData('Steve', 38, Colors.blue[600]),
    ChartData('Jack', 34, Colors.blue[400]),
    ChartData('Others', 52, Colors.grey)
  ];
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}