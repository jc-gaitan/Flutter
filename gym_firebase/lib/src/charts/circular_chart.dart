/// Package import
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

Widget circularChart() {
  return SfCircularChart(
    annotations: <CircularChartAnnotation>[
      CircularChartAnnotation(
        height: '100%',
        width: '100%',
        widget: Container(
          child: PhysicalModel(
            shape: BoxShape.circle,
            elevation: 10,
            shadowColor: Colors.black,
            color: const Color.fromRGBO(230, 230, 230, 1),
            child: Container(),
          ),
        ),
      ),
      CircularChartAnnotation(
        widget: Container(
          child: const Text(
            '62%',
            style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 14),
          ),
        ),
      )
    ],
    series: _getElevationDoughnutSeries(),
  );
}

/// Get default column series
List<DoughnutSeries<ChartSampleData, String>> _getElevationDoughnutSeries() {
  final List<ChartSampleData> chartData = <ChartSampleData>[
    ChartSampleData(
      'A',
      62,
      const Color.fromRGBO(0, 220, 252, 1),
    ),
    ChartSampleData(
      'B',
      (100 - 62),
      const Color.fromRGBO(230, 230, 230, 1),
    )
  ];

  return <DoughnutSeries<ChartSampleData, String>>[
    DoughnutSeries<ChartSampleData, String>(
        dataSource: chartData,
        animationDuration: 0,
        xValueMapper: (ChartSampleData data, _) => data.x,
        yValueMapper: (ChartSampleData data, _) => data.y,
        pointColorMapper: (ChartSampleData data, _) => data.pointColor)
  ];
}

class ChartSampleData {
  ChartSampleData(
    this.x,
    this.y,
    this.pointColor,
    /*this.lineColor*/
  );

  String x;
  double y;
  Color pointColor;
  //final Color lineColor;
}
