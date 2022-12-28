import 'package:flutter/material.dart';

import 'home.dart';
import 'menu.dart';

class ProjectPage extends StatefulWidget {
  final String asd;

  // const ProjectPage(String title, {Key? key}) : super(key: key);
  const ProjectPage(this.asd); //화면전환하면서 프로젝트 이름 데이터를 가져옴

  @override
  _ProjectPage createState() => _ProjectPage();
}

class _ProjectPage extends State<ProjectPage> {
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
        title: Text('${widget.asd}'), //가져온 프로젝트 데이터 이름으로 타이틀 설정

        actions: <Widget> [
          IconButton(
            icon: const Icon(
              Icons.home,
              semanticLabel: 'home',
            ),
            onPressed: () {
              print('home');
              Navigator.pop(context,
                MaterialPageRoute(builder: (context) => const MenuPage()));
            },
          ),
        ],
      ),


        body: SafeArea(
        child: ListView(
          
        ),
      ),
    );
  }
}