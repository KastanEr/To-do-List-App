import 'package:flutter/material.dart';
import 'package:todolist/model/todoproject.dart';

import 'package:todolist/running.dart';
import 'package:todolist/upcomming.dart';
import 'logineduser.dart';
import 'package:todolist/calendar.dart';
import 'firebasecontroller.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'project.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<Widget> _getProjectList() {
    List<Widget> listTiles = <Widget>[
      ListTile(
        leading: const Icon(Icons.account_circle),
        title: const Text('내 프로필'),
        onTap: () {
        },
      ),
      ListTile(
        leading: const Icon(Icons.stacked_bar_chart),
        title: const Text('업무 진척도'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => runningPage()),
          );
        },
      ),
      ListTile(
        leading: Icon(Icons.star, color: Colors.yellow.shade700),
        title: const Text('오늘'),
        onTap: () {
        },
      ),
      ListTile(
        leading: const Icon(Icons.wysiwyg, color: Colors.deepPurpleAccent),
        title: const Text('예정'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UpcommingPage()),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.calendar_month, color: Colors.red,),
        title: const Text('캘린더'),
        onTap: () {
          print("캘린더");
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => CalendarPage()),
          // );
        },
      ),

      const Divider(
        height: 10,
        thickness: 2,
        indent: 10,
        endIndent: 10,
      ),
    ];
    List<TodoProject> projectList = LoginedUser.loginedUser.projectList;
    for(int i = 0; i < projectList.length; i++) {
      String asd;
      listTiles.add(ListTile(
        title: Text(projectList[i].title),
        onTap: () {
          print('프로젝트');
          asd = projectList[i].title;
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProjectPage(asd)
            ),
          );
        }

      ));
    }
    return listTiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('메뉴'),
      ),

      body: SafeArea(
        child: ListView(
          children: _getProjectList(),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => setState(() {
          LoginedUser.loginedUser.projectList.add(TodoProject(title: 'Test Project'));
        }),
      ),
    );
  }
}