/// Package import
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

Widget columnChart() {
  return SfCartesianChart(
    plotAreaBorderWidth: 0,
    /*title: ChartTitle(
        text: isCardView ? '' : 'Population growth of various countries'),*/
    primaryXAxis: CategoryAxis(
      majorGridLines: const MajorGridLines(width: 0),
      labelStyle: TextStyle(color: Colors.white),
    ),
    primaryYAxis: NumericAxis(
      axisLine: const AxisLine(width: 0),
      labelFormat: '{value}',
      majorTickLines: const MajorTickLines(size: 0),
      interval: 10,
      labelStyle: TextStyle(color: Colors.white),
    ),
    series: _getDefaultColumnSeries(),
    //tooltipBehavior: _tooltipBehavior,
  );
}

/// Get default column series
List<ColumnSeries<Asistencia, String>> _getDefaultColumnSeries() {
  final List<Asistencia> chartData = <Asistencia>[
    Asistencia('DOM', 100),
    Asistencia('LUN', 70),
    Asistencia('MAR', 86),
    Asistencia('MIE', 0),
    Asistencia('JUE', 26),
    Asistencia('VIE', 23),
    Asistencia('SAD', 45),
  ];
  return <ColumnSeries<Asistencia, String>>[
    ColumnSeries<Asistencia, String>(
      dataSource: chartData,
      xValueMapper: (Asistencia sales, _) => sales.dia,
      yValueMapper: (Asistencia sales, _) => sales.minutos,
      dataLabelSettings: const DataLabelSettings(
        isVisible: true,
        textStyle: TextStyle(
          fontSize: 8,
          //color: Color.fromRGBO(9, 207, 136, 1),
          color: Colors.black,
        ),
        labelAlignment: ChartDataLabelAlignment.top,
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.0),
        topRight: Radius.circular(15.0),
      ),
      borderColor: Color.fromRGBO(83, 114, 223, 1),
      borderWidth: 1.5,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(255, 230, 6, 1),
          Color.fromRGBO(66, 133, 244, 1),
        ],
      ),
      width: 0.5,
    )
  ];
}

class Asistencia {
  Asistencia(
    this.dia,
    this.minutos,
    /*this.lineColor*/
  );

  String dia;
  double minutos;
  //final Color lineColor;
}
