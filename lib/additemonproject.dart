import 'package:flutter/material.dart';
import 'package:todolist/firebasecontroller.dart';
import 'package:todolist/logineduser.dart';

class AddItemOnProjectPage extends StatefulWidget {
  const AddItemOnProjectPage({Key? key}) : super(key: key);
  

  @override
  _AddItemOnProjectPage createState() => _AddItemOnProjectPage();
}

class _AddItemOnProjectPage extends State<AddItemOnProjectPage> with TickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController headingController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String headingTitle = '';

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
                      hintText: '주제를 입력하세요',
                      border: OutlineInputBorder(),
                    ),

                      // Set controller to textController
                    controller: headingController,

                      // Set onEditingComplete
                    onEditingComplete: () {
                      setState(() {
                        
                        headingController.text;
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
                            context
                          );
                        },
                        child: const Text('취소'),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                        onPressed: () {

                        },
                        child: const Text('추가'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[

              ],
            ),
          )
        ],
      ),
    );
  }
}