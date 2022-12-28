import 'package:flutter/material.dart';
import 'package:todolist/menu.dart';
import 'package:todolist/today.dart';
import 'package:todolist/upcomming.dart';

import 'home.dart';
import 'login.dart';
import 'mypage.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark
      ),
      title: 'To Do',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const HomePage(),
        '/menu': (BuildContext context) => const MenuPage(),
        '/upcomming': (BuildContext context) => const UpcommingPage(),
        '/today': (BuildContext context) => const Today(),
        '/mypage': (BuildContext context) => const MyPage(),
      },
    );
  }
}