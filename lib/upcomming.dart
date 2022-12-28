import 'package:flutter/material.dart';
import 'package:todolist/logineduser.dart';
import 'package:todolist/model/todo.dart';

class UpcommingPage extends StatefulWidget {
  const UpcommingPage({Key? key}) : super(key: key);

  @override
  _UpcommingPage createState() => _UpcommingPage();
}

class _UpcommingPage extends State<UpcommingPage> {
  List<Widget> _getUpcommingList() {
    List<Todo> upcommingList = <Todo>[];
    List<Widget> upcommingView = <Widget>[];
    for(int i = 0; i < LoginedUser.loginedUser.defaultProject.contnet.length; i++) {
      if(LoginedUser.loginedUser.defaultProject.contnet[i] is Todo) {
        upcommingList.add(LoginedUser.loginedUser.defaultProject.contnet[i]);
      }
    }
    for(int i = 0; i <LoginedUser.loginedUser.projectList.length; i++) {
      for(int j = 0; j < LoginedUser.loginedUser.projectList[i].contnet.length; i++) {
        if(LoginedUser.loginedUser.projectList[i].contnet[j] is Todo) {
          upcommingList.add(LoginedUser.loginedUser.projectList[i].contnet[j]);
        }
      }
    }
    //upcommingList.sort((a,b) => a.finalDeadLine.compareTo(b.finalDeadLine));
    return upcommingView;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('예정'),
      ),

      body: SafeArea(
        child: ListView(
          children: _getUpcommingList(),
        ),
      ),
    );
  }
}