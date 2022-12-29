import 'package:flutter/material.dart';
import 'package:todolist/menu.dart';
import 'package:todolist/notification.dart';
import 'package:todolist/logineduser.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'firebasecontroller.dart';
import 'dart:async';
import 'package:todolist/model/todoproject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'logineduser.dart';

class ProgressIndicatorApp extends StatelessWidget {
  const ProgressIndicatorApp({super.key});


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _ProgressIndicatorExampleState();
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget ({Key? key}) : super(key: key);

  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();

}

class MyImportantWidget extends StatefulWidget {
  MyImportantWidget({Key? key}) : super(key: key);

  _MyImportantWidgetState createState() => _MyImportantWidgetState();
}



class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  List<bool> isChecked = [];
  List<bool> isStarCheck = [];

  List<String> tasks = ['개인과제','프로젝트','플러터','개인과제','프로젝트','플러터'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(5.0),
      itemCount: tasks.length,
      itemBuilder: (BuildContext ctx, int idx) {
        isChecked.add(false);
        isStarCheck.add(false);
        return CheckboxListTile(
          title: Text("${tasks[idx]}"),
          subtitle: Text("날짜데이터"),
          checkColor: Colors.black,
          controlAffinity: ListTileControlAffinity.leading,
          value: isChecked[idx],
          onChanged: (bool? value) {
            setState(() {
              isChecked[idx] = value!;
            });
          },
            secondary: IconButton(
                onPressed: (){
                  setState(() {
                    isStarCheck[idx] = !isStarCheck[idx];
                  });
                },
                icon: isStarCheck[idx] ? Icon(Icons.star,color: Colors.amberAccent,) : Icon(Icons.star_border)
            )
        );

      },
    );

  }

}

class _MyImportantWidgetState extends State<MyImportantWidget> {

  List<String> tasks = ['공부하기','책읽기','자바공부','그냥잇기'];
  List<bool> isChecked = [];
  List<bool> isStarCheck = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(5.0),
        itemCount: tasks.length,
        itemBuilder: (BuildContext ctx, int idx) {
          isChecked.add(false);
          isStarCheck.add(false);
          return CheckboxListTile(
              title: Text("${tasks[idx]}"),
              subtitle: Text("날짜데이터"),
              checkColor: Colors.black,
              controlAffinity: ListTileControlAffinity.leading,
              value: isChecked[idx],
              onChanged: (bool? value) {
                setState(() {
                  isChecked[idx] = value!;
                });
              },
              secondary: IconButton(
                  onPressed: (){
                    setState(() {
                      isStarCheck[idx] = !isStarCheck[idx];
                    });
                  },
                  icon: isStarCheck[idx] ? Icon(Icons.star,color: Colors.amberAccent,) : Icon(Icons.star_border)
              )
          );
        }
    );
  }

}


class _ProgressIndicatorExampleState extends State<HomePage>
    with TickerProviderStateMixin {

  int myAllTask = 0; // 유저가 생성한 전체 업무
  int myDoneTask = 0; // 유저가 완료한 업무

  void setState(VoidCallback fn) {
    myAllTask = LoginedUser.loginedUser.numberOfTodo; // 유저가 생성한 전체 업무
    myDoneTask = LoginedUser.loginedUser.numberOfDone; // 유저가 완료한 업무

    super.setState(fn);
  }
class MyEventList extends StatelessWidget{
  List<String> tasks = ['개인과제','프로젝트','플러터','개인과제','프로젝트','플러터'];
  Widget build(BuildContext context){
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: tasks.length,
        itemBuilder: (BuildContext ctx, int idx) {
          return ListTile(
            leading : Checkbox(
              value: false,
              onChanged: (bool? value) {
                value = value!;
              },
            ),
            title: Text("${tasks[idx]}"),
            trailing: IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.star_border),

            ),

          );
        }
    );
  }

}

class MyimportantList extends StatelessWidget{
  List<String> tasks = ['직','무','유','기'];
  Widget build(BuildContext context){
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: tasks.length,
        itemBuilder: (BuildContext ctx, int idx) {
          return ListTile(
              leading : Checkbox(
                value: false,
                onChanged: (bool? value) {
                  value = value!;
                },
              ),
              title: Text("${tasks[idx]}"),
              trailing: Text("d-7")

          );
        }
    );
  }

}

class _ProgressIndicatorExampleState extends State<HomePage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;
  List<bool> isChecked = [];
  List<bool> Checked = [];

  late AnimationController controller;
  bool determinate = false;
  List<bool> isChecked = [];
  List<bool> Checked = [];

  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat();
    super.initState();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () async {
            await LoginedUser.updateProjectList();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MenuPage()),
            );
          },
        ),
        title: Text(LoginedUser.loginedUser.name),

        actions: <Widget> [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              semanticLabel: 'notifications',
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
              print('Notification Button');
            },
          ),
        ],
      ),


      body: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  const Text(
                    '나의 업무진척도',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 100,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 2000,
                    percent: (myDoneTask.toDouble()/myAllTask.toDouble()),
                    center: Text("${myDoneTask.toDouble()/(myAllTask.toDouble())}"),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.blueAccent,
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.only(top: 15.0),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(15.0)
                    )
                ),


                child: Column(
                    children:[
                      Text("Today",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                      Container(
                        margin: const EdgeInsets.all(16.0),
                        padding: const EdgeInsets.all(16.0),
                        height: 200,
                        child: MyStatefulWidget(),
                      )
                    ]
                )
            ),
            Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(15.0)
                    )
                ),

                child: Column(
                    children:[
                      Text("중요일정",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        padding: const EdgeInsets.all(16.0),
                        height: 200,
                        child: MyImportantWidget(),
                      )
                    ]
                )
            )
          ],
        ),
      ),

    );
  }
}