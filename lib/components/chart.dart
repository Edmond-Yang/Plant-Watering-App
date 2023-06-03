import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../services/data.dart';

class Chart extends StatelessWidget {

  List<ChartData> temperature = [], humidity = [], soilMoisture = [], waterWeight = [];

  Chart({super.key});

  @override
  Widget build(BuildContext context) {

    final Map info = Provider.of<Data>(context).getPlantsAndWeather();

    double w = MediaQuery.of(context).size.width*0.95;

    temperature = [];
    humidity = [];
    soilMoisture = [];
    waterWeight = [];

    for(var d in info['detail']['plant']){
      int temp = ((4095-d['soil_moisture'])/4095*100).round();
      temperature.add(ChartData(d['time'], d['temperature']));
      humidity.add(ChartData(d['time'], d['moisture']));
      soilMoisture.add(ChartData(d['time'], temp));
      waterWeight.add(ChartData(d['time'], d['gravity']));

    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: w,
        height: 300,
        child: SfCartesianChart(
          legend: Legend(isVisible: true, position: LegendPosition.bottom, textStyle: const TextStyle(
            fontFamily: 'TaipeiSansTCBeta',
          )),
          enableAxisAnimation: true,
          primaryXAxis: CategoryAxis(
            autoScrollingDelta: 4,
            autoScrollingMode: AutoScrollingMode.end,
          ),
          primaryYAxis: NumericAxis(
            minimum: 0.0,
          ),
          zoomPanBehavior: ZoomPanBehavior(
            enablePanning: true,
          ),
          series: <ChartSeries>[
            LineSeries<ChartData, String>(
                dataSource: temperature,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                isVisible: true,
                color: Colors.red,
                name: '溫度'
            ),
            LineSeries<ChartData, String>(
                dataSource: humidity,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                isVisible: true,
                color: Colors.blue,
                name: '濕度'
            ),
            LineSeries<ChartData, String>(
                dataSource: soilMoisture,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                isVisible: true,
                color: Colors.brown,
                name: '土壤濕度'
            ),
            LineSeries<ChartData, String>(
                dataSource: waterWeight,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                isVisible: true,
                color: Colors.lightGreen,
                name: '水重'
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  final String x;
  final int y;

  ChartData(this.x, this.y);
}
