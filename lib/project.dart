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
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => const MenuPage())
            );
          },
        ),

        actions: <Widget> [
          IconButton(
              onPressed: (){
                print('chatting');
              },
              icon: Icon(Icons.chat)),
          IconButton(
              onPressed: (){
                print('search');
              },
              icon: Icon(Icons.search)),
          IconButton(
            icon: const Icon(
              Icons.home,
              semanticLabel: 'home',
            ),
            onPressed: () {
              print('home');
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),

        ],
      ),


        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left:20.0,top: 15.0,right:20.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                      )

                  )
              ),

              child : Row(
                  children: [
                    Text("${widget.asd}", //가져온 프로젝트 데이터 이름으로 타이틀 설정
                      style: TextStyle(fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
                  ]

              ),




            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.date_range)
                    ],
                  )
                ],
              ),
            )
          ],
        )


      );
  }
}