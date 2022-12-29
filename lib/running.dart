import 'package:flutter/material.dart';
import 'package:todolist/home.dart';
import 'package:todolist/menu.dart';
import 'chart/ui_chart/bar_chart.dart';
import 'chart/ui_chart/pie_chart.dart';
import 'logineduser.dart';

class runningPage extends StatelessWidget {

  runningPage({Key? key}) : super(key: key);

  // 바 차트에서 사용할 임의의 데이터
  List<double> points = [20, 30, 50, 100, 150, 120, 70, 30]; // 그래프에 나타낼 임의의 포인트 값
  List<String> labels = [ // 가로축에 적을 텍스트(레이블)
    "Bronze",
    "Silver",
    "Gold",
    "Platinum",
    "Diamond",
    "Master",
    "Gmaster",
    "Challenger",
  ];

  int myAllTask = LoginedUser.loginedUser.numberOfTodo;
  // 유저가 생성한 전체 업무

  int myDoneTask = LoginedUser.loginedUser.numberOfDone;
  // 유저가 완료한 업무

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            semanticLabel: 'arrow_back_ios',
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text('running'),

        actions: <Widget> [
          IconButton(
            icon: const Icon(
              Icons.home,
              semanticLabel: 'home',
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
        ],
      ),
      body: Column (
        children: [
          SizedBox(height: 50.0,),
          Text('Schedule Status',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          SizedBox(height: 30.0,),
          Row(
            children: [
              SizedBox(width: 25.0,),
              CustomPaint(
                size: Size(150, 150),
                painter: PieChart(percentage: myDoneTask, // 임의의 값
                    textScaleFactor: 1.0),
              ),
              SizedBox(width: 25.0,),
              Text(" 완료한 일 : $myDoneTask \n 생성한 일 : $myAllTask",style: TextStyle(fontSize: 20),)
            ],
          ),
          SizedBox(height: 70.0,),
          Text("Management Tier",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          SizedBox(height: 30.0,),
          Row(
            children: [
              SizedBox(width: 25.0,),
              CustomPaint(
                  size: Size(200,200),
                  foregroundPainter: BarChart(
                      data : points,
                      labels :labels,
                      color: Color(0xFF151F14))
              ),
              SizedBox(width: 20.0,),
              Text(" 당신의 티어는 \n ${labels[4]} 입니다.",style: TextStyle(fontSize: 20),),
            ],
          ),
        ],
      )
    );
  }
}