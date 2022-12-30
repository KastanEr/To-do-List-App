import 'package:flutter/material.dart';
import 'package:todolist/firebasecontroller.dart';
import 'package:todolist/logineduser.dart';
import 'package:todolist/model/todoproject.dart';
import 'package:todolist/project.dart';

import 'model/todo.dart';

class AddItemOnProjectPage extends StatefulWidget {
  late TodoProject project;
  AddItemOnProjectPage(TodoProject inputProject, {Key? key}) : super(key: key) {
    project = inputProject;
  }

  @override
  _AddItemOnProjectPage createState() => _AddItemOnProjectPage();
}

class _AddItemOnProjectPage extends State<AddItemOnProjectPage> with TickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController headingController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String todoTitle = '';
  String todoDescription = '';
  
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('새 항목 추가'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: '제목 추가',
            ),
            Tab(
              text: '할일 추가',
            ),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: '주제',
                      border: OutlineInputBorder(),
                    ),

                      // Set controller to textController
                    controller: headingController,

                      // Set onEditingComplete
                    onEditingComplete: () {
                      setState(() {
                        widget.project.content.add('H:${headingController.text}');
                        FirebaseController.updateProject(widget.project);
                        Navigator.pop(context, 'This is true');
                      });
                      headingController.clear();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            'This is true',
                          );
                        },
                        child: const Text('취소'),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          widget.project.content.add('H:${headingController.text}');
                          FirebaseController.updateProject(widget.project);
                          Navigator.pop(context, 'This is true');
                        },
                        child: const Text('추가'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: '제목',
                      border: OutlineInputBorder(),
                    ),
                    controller: titleController,
                    onEditingComplete: () {
                      setState(() {
                        todoTitle = titleController.text;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLines: 20,
                    minLines: 10,
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: '메모',
                      border: OutlineInputBorder(),
                    ),
                    controller: descriptionController,
                    onEditingComplete: () {
                      setState(() {
                        todoDescription = descriptionController.text;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text("${_selectedDate.year}.${_selectedDate.month}.${_selectedDate.day}"),
                        const SizedBox(width: 8,),
                        ElevatedButton(
                          onPressed: () async {
                            DateTime? selecDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2025),
                            );
                            setState(() {
                              if(selecDate != null) {
                                _selectedDate = selecDate;
                              }
                            });
                          },
                          child: const Text('마감일 선택'),
                        )
                      ]
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(
                            context, 'This is true'
                          );
                        },
                        child: const Text('취소'),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Todo todo = Todo(title: titleController.text, description: descriptionController.text, deadLine: _selectedDate);
                          var docRef = await FirebaseController.addTodo(todo);
                          todo.tid = docRef.id;
                          FirebaseController.updateTodo(todo);
                          widget.project.content.add(docRef.id);
                          FirebaseController.updateProject(widget.project);
                          LoginedUser.loginedUser.numberOfTodo += 1;
                          FirebaseController.updateUser(LoginedUser.loginedUser);
                          Navigator.pop(
                            context,
                            'This is true'
                          );
                        },
                        child: const Text('추가'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}