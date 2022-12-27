import 'package:flutter/material.dart';
import 'package:todolist/chart/main.dart';
import 'package:todolist/chart/ui/chart_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChartPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}