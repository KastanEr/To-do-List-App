import 'package:flutter/material.dart';
import 'package:todolist/menu.dart';

class ProgressIndicatorApp extends StatelessWidget {
  const ProgressIndicatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true, colorSchemeSeed: const Color(0xff6750a4)),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<HomePage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;
  List<bool> isChecked = [];

  // today List
  List<Widget> _getTodayList () {

    List<Widget> todayList = <Widget>[];

    for (var i = 0; i < 3; i++) {
      isChecked.add(false);
      todayList.add(
          Container(
              child : Row (
                children: <Widget>[
                  Checkbox(
                    value: isChecked[i],
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked[i] = value!;
                      });
                    },
                  ),
                  Text("일정 ${i+1}"),

                ],
              )
          )
      );
    }

    return todayList;
  }

  // daily List
  List<Widget> _getDailyList () {

    bool? _isChecked = false;

    List<Widget> dailyList = <Widget>[];

    for (var i = 0; i < 3; i++) {
      // todayList.add(Text("data $i "));
      dailyList.add(
          Container(
              child : Row (
                children: <Widget>[
                  Checkbox(value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value;
                      });
                    },
                  ),
                  Text("일정 ${i+1}"),

                ],
              )
          )

      );
    }
    return dailyList;
  }

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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MenuPage()),
            );
          },
        ),

        title: const Icon(Icons.account_circle),

        actions: <Widget> [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              semanticLabel: 'notifications',
            ),
            onPressed: () {
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
                  LinearProgressIndicator(
                    value: controller.value,
                    semanticsLabel: '나의 업무진척도',
                  ),
                  const SizedBox(height: 10,),
                  Row (
                    children: <Widget>[
                      Expanded (
                        child: Text(
                          '프로그래스바 멈추기(임시)',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      Switch(
                          value: determinate,
                          onChanged: (bool value) {
                            setState(() {
                              determinate = value;
                              if(determinate) {
                                controller.stop();
                              }
                              else {
                                controller
                                  ..forward(from: controller.value)
                                  ..repeat();
                              }
                            });
                          })
                    ],
                  ),

                ],
              ),

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
                children: <Widget>[
                  Row(
                    children: [
                      Text('Today',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                      SizedBox(width: 190,),
                      IconButton(
                        icon: const Icon(
                          Icons.add,
                          semanticLabel: 'add',
                        ),
                        onPressed: () {
                          print('add button pressed');
                        },
                      ),
                    ],
                  ),

                  Container(
                    height: 100,
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: _getTodayList(),
                    ),
                  ),

                ],
              ),
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
                children: <Widget>[
                  Row(
                    children: [
                      Text('중요일정',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                      SizedBox(width: 180,),
                    ],
                  ),
                  Container(
                    height: 100,
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: _getDailyList(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
