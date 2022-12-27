import 'package:flutter/material.dart';
import 'package:todolist/running.dart';

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

      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('내 프로필'),
              onTap: () {
                print("내 프로필");
              },
            ),
            ListTile(
              leading: const Icon(Icons.stacked_bar_chart),
              title: const Text('업무 진척도'),
              onTap: () {
                print("업무 진척도");
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
                print("오늘");
              },
            ),
            ListTile(
              leading: const Icon(Icons.wysiwyg, color: Colors.deepPurpleAccent),
              title: const Text('예정'),
              onTap: () {
                print("예정");
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month, color: Colors.red,),
              title: const Text('캘린더'),
              onTap: () {
                print("캘린더");
              },
            ),

            const Divider(
              height: 10,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),

            

          ],
        ),
      ),


    );
  }
}