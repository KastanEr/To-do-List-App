import 'package:flutter/material.dart';
import 'package:todolist/model/todoproject.dart';
import 'package:todolist/project.dart';
import 'package:todolist/running.dart';
import 'package:todolist/upcomming.dart';
import 'calender.dart';
import 'logineduser.dart';
import 'firebasecontroller.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist/project.dart';

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

      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseController.projectGet,
        builder: _builder,
      ),
      
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          String? inputText = await showMyDialog(context);
          if (inputText == null) return;
          TodoProject project = TodoProject(title: inputText);
          var docRef = await FirebaseController.addProject(project);
          project.pid = docRef.id;
          FirebaseController.updateProject(project);
          LoginedUser.loginedUser.projectList.add(docRef.id);
          FirebaseController.updateUser(LoginedUser.loginedUser);
          LoginedUser.updateProjectList();
          setState(() {});
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

  for(int i = 0; i < LoginedUser.projectList.length; i++) {
    listTiles.add(
      ListTile(
        title: Text(LoginedUser.projectList[i].title),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProjectPage(LoginedUser.projectList[i])),
          );
        },
      )
    );
  }

  return ListView(
    children: listTiles,
  );
}

