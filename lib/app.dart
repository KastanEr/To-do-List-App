import 'package:flutter/material.dart';
import 'package:todolist/menu.dart';
import 'package:todolist/profile.dart';
import 'package:todolist/upcomming.dart';

import 'home.dart';
import 'today.dart';
import 'mypage.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  static const Color black = Color(0xFF000000);

  static const MaterialColor paleYellow = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xfffef8),
      100: const Color(0xfffef8),
      200: const Color(0xfffef8),
      300: const Color(0xfffef8),
      400: const Color(0xfffef8),
      500: const Color(0xfffef8),
      600: const Color(0xfffef8),
      700: const Color(0xfffef8),
      800: const Color(0xfffef8),
      900: const Color(0xfffef8),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryTextTheme: Typography(platform: TargetPlatform.iOS).black,
        primarySwatch: paleYellow,
        iconTheme: const IconThemeData(color: Colors.black),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary),
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72, color: black, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 36, color: black, fontStyle: FontStyle.italic),
          bodyText1: TextStyle(fontSize: 14, color: black),
          bodyText2: TextStyle(fontSize: 10, color: black),
        ),
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
        '/profile': (BuildContext context) => Profile(),
      },
    );
  }
}