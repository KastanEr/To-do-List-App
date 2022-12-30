import 'package:flutter/material.dart';

import 'package:todolist/mypage.dart';

import 'package:todolist/model/todoproject.dart';
import 'package:todolist/profile.dart';

import 'package:todolist/project.dart';
import 'package:todolist/running.dart';
import 'package:todolist/today.dart';
import 'package:todolist/upcomming.dart';
import 'calender.dart';
import 'logineduser.dart';
import 'firebasecontroller.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';


Future<String?> showMyDialog(BuildContext context, [TodoProject? project]) async {
  TextEditingController controller = TextEditingController(
    text: project?.title ?? '',
  );
  String? resultText;

  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('프로젝트 이름을 입력하세요'),
      content: TextField(
        controller: controller,
        autofocus: true,
      ),
      actions: [
        TextButton(
          onPressed: () {
            resultText = controller.text;
            controller.clear();
            Navigator.of(context).pop();
          },
          child: const Text('프로젝트 생성'),
        ),
      ],
    ),
  );
  return resultText;
}

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('메뉴'),
      ),


      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseController.projectSnapshots,

        builder: _builder,

      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          String? inputText = await showMyDialog(context);
          if (inputText == null) return;
          TodoProject project = TodoProject(title: inputText);
          FirebaseController.addProject(project).then((docRef) { project.pid = docRef.id;
            FirebaseController.updateProject(project);
            LoginedUser.loginedUser.projectList.add(docRef.id);
            FirebaseController.updateUser(LoginedUser.loginedUser);
          });
        },
      ),
    );
  }
}

Widget _builder(BuildContext context, AsyncSnapshot snapshot) {
  List<Widget> listTiles = <Widget>[
    ListTile(
      leading: const Icon(Icons.account_circle),
      title: const Text('내 프로필'),
      onTap: () {
        var push = Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyPage()),
        );
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Today()),
        );
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CalendarPage()),
        );
      },
    ),

    const Divider(
      height: 10,
      thickness: 2,
      indent: 10,
      endIndent: 10,
    ),
  ];

  for(int i = 0; i < LoginedUser.loginedUser.projectList.length; i++) {
    listTiles.add(
      ListTile(
        title: Text(LoginedUser.projects[LoginedUser.loginedUser.projectList[i]]!.title),
        onTap: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProjectPage(LoginedUser.projects[LoginedUser.loginedUser.projectList[i]]!)),
          );
        },
      )
    );
  }
  return ListView(
    children: listTiles,
  );
}

