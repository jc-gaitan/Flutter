/// Package import
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

Widget columnChartMedidas(List<double> medidas) {
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
    series: _getDefaultColumnSeries(medidas),
    tooltipBehavior: _tooltipBehavior,
  );
}

/// Get default column series
List<ColumnSeries<Medida, String>> _getDefaultColumnSeries(
    List<double> medidas) {
  final List<Medida> chartData = <Medida>[
    Medida('ENE', medidas.elementAt(0)),
    Medida('FEB', medidas.elementAt(1)),
    Medida('MAR', medidas.elementAt(2)),
    Medida('ABR', medidas.elementAt(3)),
    Medida('MAY', medidas.elementAt(4)),
    Medida('JUN', medidas.elementAt(5)),
    Medida('JUL', medidas.elementAt(6)),
    Medida('AGO', medidas.elementAt(7)),
    Medida('SEP', medidas.elementAt(8)),
    Medida('OCT', medidas.elementAt(9)),
    Medida('NOV', medidas.elementAt(10)),
    Medida('DIC', medidas.elementAt(11)),
  ];
  return <ColumnSeries<Medida, String>>[
    ColumnSeries<Medida, String>(
      dataSource: chartData,
      xValueMapper: (Medida sales, _) => sales.mes,
      yValueMapper: (Medida sales, _) => sales.medid,
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

class Medida {
  Medida(
    this.mes,
    this.medid,
    /*this.lineColor*/
  );

  String mes;
  double medid;
  //final Color lineColor;
}
