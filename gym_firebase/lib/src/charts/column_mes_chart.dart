/// Package import
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

Widget columnChartMes(List<double> minutos) {
  TooltipBehavior _tooltipBehavior =
      TooltipBehavior(enable: true, header: '', canShowMarker: false);

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
      interval: 3,
      labelStyle: TextStyle(color: Colors.white),
    ),
    series: _getDefaultColumnSeries(minutos),
    tooltipBehavior: _tooltipBehavior,
  );
}

/// Get default column series
List<ColumnSeries<Asistencia, String>> _getDefaultColumnSeries(
    List<double> minutos) {
  final List<Asistencia> chartData = <Asistencia>[
    Asistencia('ENE', minutos.elementAt(0)),
    Asistencia('FEB', minutos.elementAt(1)),
    Asistencia('MAR', minutos.elementAt(2)),
    Asistencia('ABR', minutos.elementAt(3)),
    Asistencia('MAY', minutos.elementAt(4)),
    Asistencia('JUN', minutos.elementAt(5)),
    Asistencia('JUL', minutos.elementAt(6)),
    Asistencia('AGO', minutos.elementAt(7)),
    Asistencia('SEP', minutos.elementAt(8)),
    Asistencia('OCT', minutos.elementAt(9)),
    Asistencia('NOV', minutos.elementAt(10)),
    Asistencia('DIC', minutos.elementAt(11)),
  ];
  return <ColumnSeries<Asistencia, String>>[
    ColumnSeries<Asistencia, String>(
      dataSource: chartData,
      xValueMapper: (Asistencia sales, _) => sales.mes,
      yValueMapper: (Asistencia sales, _) => sales.minutos,
      dataLabelSettings: const DataLabelSettings(
        isVisible: false,
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
    this.mes,
    this.minutos,
    /*this.lineColor*/
  );

  String mes;
  double minutos;
  //final Color lineColor;
}
