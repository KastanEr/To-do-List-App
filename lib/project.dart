import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/additemonproject.dart';
import 'package:todolist/firebasecontroller.dart';
import 'package:todolist/logineduser.dart';
import 'package:todolist/model/todoproject.dart';

import 'home.dart';
import 'menu.dart';
import 'model/todo.dart';

class ProjectPage extends StatefulWidget {
  final TodoProject project;
  const ProjectPage(this.project); //화면전환하면서 프로젝트 이름 데이터를 가져옴

  @override
  _ProjectPage createState() => _ProjectPage();
}

class _ProjectPage extends State<ProjectPage> {
  TextEditingController projectdate = TextEditingController();

  List<Widget> _getProjectContent(TodoProject project) {
    Map<int, dynamic> projectMap = {};
    List<Widget> contentList = <Container>[];
  
    for(int i = 0; i < project.content.length; i++) {
      if(project.content[i][0] == 'H') {
        if(project.content[i][1] == ':') {
          projectMap[i] = project.content[i].substring(2);
        }
        else {
          for(int j = 0; j < LoginedUser.todoList.length; j++) {
            if(project.content[i] == LoginedUser.todoList[j].tid) {
              projectMap[i] = LoginedUser.todoList[j];
            }
          }
        }
      }
      else {
        for(int j = 0; j < LoginedUser.todoList.length; j++) {
          if(project.content[i] == LoginedUser.todoList[j].tid) {
            projectMap[i] = LoginedUser.todoList[j];
          }
        }
      }
    }
    for(int i = 0; i < projectMap.length; i++) {
      if(projectMap[i] is String) {
        contentList.add(
          Row(
            children: [
              Text(
                projectMap[i],
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        );
      }
      else if (projectMap[i] is Todo) {
        contentList.add(
          Row(
            children: [
              IconButton(
                onPressed: () async {
                  projectMap[i].toggleDone();
                  FirebaseController.updateTodo(projectMap[i]);
                  setState(() {});
                },
                icon: Icon(projectMap[i].done ? Icons.check_box : Icons.check_box_outline_blank,),
              ),
              Text(
                textAlign: TextAlign.start,
                projectMap[i].title,
              ),
              IconButton(
                onPressed: () async {
                  projectMap[i].toggleImportant;
                  FirebaseController.updateTodo(projectMap[i]);
                  setState(() {});
                },
                icon: Icon(projectMap[i].important ? Icons.star : Icons.star_border,),
              ),
            ],
          )
        );
      }
    }
    return contentList;
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
          Navigator.pop(context,
          MaterialPageRoute(builder: (context) => const MenuPage())
              );
            },
          ),

          actions: <Widget> [
            IconButton(
              icon: const Icon(
                Icons.home,
                semanticLabel: 'home',
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),

          ],
        ),


        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(left:20.0,top: 15.0,right:20.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                  )
                )
              ),

              child: Row(
                children: [
                  Text(
                    widget.project.title, //가져온 프로젝트 데이터 이름으로 타이틀 설정
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left:20.0,top: 15.0,right:20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.date_range),
                        onPressed: () async{
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2050)
                          );
                          setState(() {
                            if (pickedDate != null) {
                              projectdate.text =DateFormat('yyyy-MM-dd').format(pickedDate).toString();
                            }
                          });
                        },),
                      Text("1st due : ${projectdate.text}"),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon:Icon(Icons.people),
                        onPressed: (){
                          print("프로젝트 공유자");
                        },),
                      Text("프로젝트 공유자"),
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 15.0),
                            child: Column(
                              children: _getProjectContent(widget.project)
                            )
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddItemOnProjectPage()),
            );
            setState(() {});
          },
        ),
    );
  }
}