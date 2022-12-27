import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/chart/ui_chart/pie_chart.dart';

import '../ui_chart/bar_chart.dart';

class ChartPage extends StatelessWidget {

  List<double> points = [50, 0, 73, 100,150, 120, 200, 80]; // 그래프에 나타낼 임의의 포인트 값

  List<String> labels = [ // 가로축에 적을 텍스트(레이블)
    "2012",
    "2013",
    "2014",
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chart Page"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: CustomPaint(
                  size: Size(150, 150),
                  painter: PieChart(percentage: 50,
                      textScaleFactor: 1.0),
                ),
              ),
              Container(
                child: CustomPaint(
                  size: Size(250,250),
                  foregroundPainter: BarChart(
                    data : points,
                    labels :labels,
                    color:Color(0xFF2A1800))
                ),
              ),
            ],
          ),
          ),
        ),
      );
  }
}

