import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/model/todoproject.dart';

import 'additemonproject.dart';
import 'firebasecontroller.dart';
import 'home.dart';
import 'logineduser.dart';
import 'menu.dart';

class ProjectPage extends StatefulWidget {
  late TodoProject project;
  late Map<int, dynamic> projectMap = {};
  ProjectPage(TodoProject inputProject, {Key? key}) : super(key: key) {
    project = inputProject;
  }

  @override
  _ProjectPage createState() => _ProjectPage(project);
}

class _ProjectPage extends State<ProjectPage> {
  TodoProject project;
  TextEditingController projectdate = TextEditingController();
  
  _ProjectPage(this.project);

  List<Widget> _getProjectContent(TodoProject project) {
    Map<int, dynamic> projectMap = {};
    for(int i = 0; i < project.content.length; i++) {
      if(project.content[i][0] == 'H' && project.content[i][1] == ':') {
        projectMap[i] = project.content[i].substring(2);
      }
      else {
        projectMap[i] = LoginedUser.todos[project.content[i]];
      }
    }
    List<Widget> contentList = <Widget>[];
    for(int i = 0; i < projectMap.length; i++) {
      if(projectMap[i] is String) {
        contentList.add(
          Row(
            children: [
              Row(
                children: [
                  Text(projectMap[i],style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          )
        );
      }
      else {
        contentList.add(
          CheckboxListTile(
            title: Text(projectMap[i].title),
            subtitle: Text(projectMap[i].deadLine.toString()),
            checkColor: Colors.black,
            controlAffinity: ListTileControlAffinity.leading,
            value: projectMap[i].done,
            onChanged: (bool? value) {
              setState(() {
                if(projectMap[i].done) {
                  if(LoginedUser.loginedUser.numberOfDone != 0) {
                    LoginedUser.loginedUser.numberOfDone -= 1;
                  } 
                }
                else {
                  LoginedUser.loginedUser.numberOfDone += 1;
                }
                FirebaseController.updateUser(LoginedUser.loginedUser);
                projectMap[i].done = value!;
                FirebaseController.updateTodo(projectMap[i]);
              });
            },
            secondary: IconButton(
                onPressed: (){
                  setState(() {
                    projectMap[i].important = !projectMap[i].important;
                    FirebaseController.updateTodo(projectMap[i]);
                  });
                },
                icon: projectMap[i].important ? const Icon(Icons.star,color: Colors.amberAccent,) : const Icon(Icons.star_border)
            )
          )
        );
      }
    }
    return contentList;
  }

  String _value = '';

  void _update(String value) {
    setState(() {
      _value = value;
    });
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
        title: Text(project.title),
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
              margin: EdgeInsets.only(left:20.0,top: 15.0,right:20.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                      )

                  )
              ),

              child: Row(
                children: [
                  Text(
                    project.title, //가져온 프로젝트 데이터 이름으로 타이틀 설정
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
              ),

            ),


            Container(
              margin: EdgeInsets.only(left:20.0,top: 15.0,right:20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon:Icon(Icons.date_range),
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


                          print("${projectdate.text}"); //projectdate.text 값이 프로젝트 마감일 이값을 데베에 저장해서 가져오면 될듯
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
                              children: _getProjectContent(project)
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
          onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddItemOnProjectPage(project)))
              .then((value) {
                _update(value);
            });
          },
        ),
    );
  }

}