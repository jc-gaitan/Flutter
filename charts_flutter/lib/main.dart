import 'package:flutter/material.dart';
import 'package:myflutterapp/grafico.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //List<SalesData> _chartData;
  //TooltipBehavior _tooltipBehavior;

  TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    //_chartData = getChartData();
    _trackballBehavior = TrackballBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap,
        lineType: TrackballLineType.vertical,
        tooltipSettings: InteractiveTooltip(format: 'point.x : point.y'));
    //_tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text('Minutos'),
              padding: EdgeInsets.symmetric(horizontal: 7.0),
            ),
            Container(
              child: Text('semana'),
              padding: EdgeInsets.symmetric(horizontal: 7.0),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: screenHeight * 0.4,
          padding: EdgeInsets.all(5.0),
          child: SfCartesianChart(
            //title: ChartTitle(text: 'Yearly sales analysis'),
            //legend: Legend(isVisible: true),
            //tooltipBehavior: _tooltipBehavior,
            series: getChartData(),
            trackballBehavior: _trackballBehavior,
            primaryXAxis: NumericAxis(
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              majorGridLines: MajorGridLines(color: Colors.transparent),
              interval: 1,
            ),
            primaryYAxis: NumericAxis(
              labelFormat: '{value}',
              interval: 10,
              //numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0), //para precios
            ),
          ),
        ),
        grafico(screenHeight),
      ],
    )));
  }

  List<LineSeries<Asistencia, double>> getChartData() {
    final List<Asistencia> chartData = [
      Asistencia(1, 25, const Color.fromRGBO(248, 184, 131, 1)),
      Asistencia(2, 12, const Color.fromRGBO(248, 184, 131, 1)),
      Asistencia(3, 24, const Color.fromRGBO(229, 101, 144, 1)),
      Asistencia(4, 18, const Color.fromRGBO(229, 101, 144, 1)),
      Asistencia(5, 30, const Color.fromRGBO(53, 124, 210, 1)),
      Asistencia(6, 55, const Color.fromRGBO(53, 124, 210, 1)),
      Asistencia(7, 10, const Color.fromRGBO(53, 124, 210, 1))
    ];
    //return chartData;

    return [
      LineSeries<Asistencia, double>(
        animationDuration: 2500,
        //name: 'Sales',
        dataSource: chartData,
        xValueMapper: (Asistencia asistencia, _) => asistencia.dia,
        yValueMapper: (Asistencia asistencia, _) => asistencia.minutos,
        //dataLabelSettings: DataLabelSettings(isVisible: true), //ocultar el valor
        enableTooltip: true,

        /// The property used to apply the color each data.
        pointColorMapper: (Asistencia asistencia, _) => asistencia.lineColor,
        width: 2,
      ),
    ];
  }
}

class SalesData {
  SalesData(this.year, this.sales, this.lineColor);
  final double year;
  final double sales;
  final Color lineColor;
}

class Asistencia {
  Asistencia(this.dia, this.minutos, this.lineColor);

  double dia;
  double minutos;
  final Color lineColor;
}
