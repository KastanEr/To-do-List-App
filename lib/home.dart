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


  List<String> today = ['오늘일정1','오늘일정2','오늘일정3'];
  List<String> daily = ['중요일정1','중요일정2','중요일정3'];

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
                  Radius.circular(15.0)
                ),
              ),
              child: Column(
                children: <Widget>[
                  const Text(
                    '진행상황을 표시하는 프로그래스바',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 30),
                  LinearProgressIndicator(
                    value: controller.value,
                    semanticsLabel: '진행상황을 표시하는 프로그래스바',
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
                    height: 200,
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: [
                        Container(
                          height: 50,
                          color: Colors.amber[600],
                          child: Center(
                            child: Text('${today[0]}'),
                          ),
                        ),
                        Container(
                          height: 50,
                          color: Colors.amber[500],
                          child: Center(
                            child: Text('${today[1]}'),
                          ),
                        ),
                        Container(
                          height: 50,
                          color: Colors.amber[100],
                          child: Center(
                            child: Text('${today[2]}'),
                          ),
                        ),
                      ],
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
                    height: 200,
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: [
                        Container(
                          height: 50,
                          color: Colors.amber[600],
                          child: Center(
                            child: Text('${daily[0]}'),
                          ),
                        ),
                        Container(
                          height: 50,
                          color: Colors.amber[500],
                          child: Center(
                              child: Text('${daily[1]}'),
                          ),
                        ),
                        Container(
                          height: 50,
                          color: Colors.amber[100],
                          child: Center(
                            child: Text('${daily[2]}'),
                          ),
                        ),
                      ],
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
