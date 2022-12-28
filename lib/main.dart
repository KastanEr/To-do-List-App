import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todolist/model/todoproject.dart';
import 'firebase_options.dart';
import 'logineduser.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  LoginedUser.loginedUser.projectList.add(TodoProject(title: '테스트 프로젝트'));
  runApp(const TodoApp());
}
