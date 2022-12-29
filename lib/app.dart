import 'package:flutter/material.dart';
import 'package:todolist/menu.dart';
import 'package:todolist/profile.dart';
import 'package:todolist/today.dart';
import 'package:todolist/upcomming.dart';

import 'home.dart';
import 'login.dart';
import 'mypage.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  static const MaterialColor white = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: white,
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
        //'/today': (BuildContext context) => const Today(),
        '/mypage': (BuildContext context) => const MyPage(),
        '/profile': (BuildContext context) => Profile(),
      },
    );
  }
}