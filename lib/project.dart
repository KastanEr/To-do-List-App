import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'home.dart';
import 'menu.dart';

class ProjectPage extends StatefulWidget {
  final String projectname;

  // const ProjectPage(String title, {Key? key}) : super(key: key);
  const ProjectPage(this.projectname); //화면전환하면서 프로젝트 이름 데이터를 가져옴

  @override
  _ProjectPage createState() => _ProjectPage();
}

class _ProjectPage extends State<ProjectPage> {
  TextEditingController projectdate = TextEditingController();

  List<bool> isChecked = [];
  List<bool> taskviewCheck=[];

  List<Container> _getTaskList(){
    List<Container> TaskList = <Container>[];

    for (var i=0; i<3; i++){
      taskviewCheck.add(false);
      TaskList.add(
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Task',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    IconButton(onPressed: (){
                      setState(() {
                        taskviewCheck[i] = !taskviewCheck[i];
                      });

                    }, icon: Icon(Icons.arrow_drop_down)),

                  ],
                ),
                Visibility(
                  visible: taskviewCheck[i],
                  child: Container(
                    height: 200,
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: _getStepList(),
                    ),
                  ),
                ),
              ],
            ),
          )

      );
    }

    return TaskList;
  }

  List<Widget> _getStepList () {
    List<Widget> stepList = <Widget>[];

    for (var i = 0; i < 3; i++) {
      isChecked.add(false);
      stepList.add(
          Container(
              child : Row (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Checkbox(
                    value: isChecked[i],
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked[i] = value!;
                      });
                    },
                  ),
                  Text("Step ${i+1}"),
                  IconButton(
                    icon: const Icon(
                      Icons.star_border,
                      semanticLabel: 'star',
                    ),
                    onPressed: () {
                      print('Icon pressed');
                    },
                  ),

                ],
              )
          )
      );
    }

    return stepList;
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
                    Text("${widget.projectname}", //가져온 프로젝트 데이터 이름으로 타이틀 설정
                      style: TextStyle(fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
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

                      Container(
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 15.0),
                                  // decoration: BoxDecoration(
                                  //     border: Border(
                                  //         bottom: BorderSide(
                                  //           color: Colors.black,
                                  //         )
                                  //
                                  //     )
                                  // ),
                                  child: Column(
                                      children: _getTaskList()


                                  )
                              ),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: (){
                                    print("add photo");
                                  }, icon: Icon(Icons.add_a_photo)),
                                  IconButton(onPressed: (){
                                    print("add document");
                                  }, icon: Icon(Icons.add_chart)),
                                  IconButton(onPressed: (){
                                    print("add photho");
                                  }, icon: Icon(Icons.mic))
                                ],
                              )

                            ],
                          )
                      ),

                    ],
                  ),

                ],
              ),
            ),

          ],
        )


    );
  }

}