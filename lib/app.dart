import 'package:flutter/material.dart';
import 'package:todolist/menu.dart';
import 'package:todolist/upcomming.dart';

import 'home.dart';
import 'login.dart';
import 'notification.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do',
      initialRoute: '/login',
      routes: {
        '/': (BuildContext context) => const HomePage(),
        '/menu': (BuildContext context) => const MenuPage(),
        '/upcomming': (BuildContext context) => const UpcommingPage(),
        '/login': (BuildContext context) => const LoginPage(),
        // '/notification': (BuildContext context) => const NotificationScreen(),
      },
    );
  }
}