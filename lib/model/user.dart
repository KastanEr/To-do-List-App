import 'package:flutter/material.dart';

import 'todoproject.dart';
import 'todonotification.dart';

class User {
  static int uidNumber = 0;
  late String uid;
  late String name;
  late String email;
  late String _password;
  late TodoProject defaultProject;
  late List<TodoProject> projectList;
  late List<String> notificationList;
  late int numberOfTodo;
  late int numberOfDone;

  User({
    required String name,
    required String email,
    required String password,
    this.numberOfDone = 0,
    this.numberOfTodo = 0,
  }) {
    uid = uidNumber.toString();
    uidNumber++;
    defaultProject = TodoProject(title: 'default');
    projectList = <TodoProject>[];
    notificationList = <String>[];
  }

  User.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  void fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    _password = json['password'];
    defaultProject = json['defaultProject'];
    projectList = json['projectList'];
    notificationList = json['notificationList'];
    numberOfTodo = json['numberOfTodo'];
    numberOfDone = json['numberOfDone'];
  }

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'name': name,
    'email': email,
    'password': _password,
    'defaultProject': defaultProject,
    'projectList': projectList,
    'notificationList': notificationList,
    'numberOfTodo': numberOfTodo,
    'numberOfDone': numberOfDone,
  };

  void addProject(TodoProject newProject) {
    projectList.add(newProject);
  }
  
  void deleteProject() {

  }
  
  void addNotification(TodoNotification newNotification) {

  }

  void deleteNotification() {
    
  }

}