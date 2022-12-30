import 'todoproject.dart';

class User {

  String? uid;
  late String name;
  late String email;
  late String password;
  late TodoProject defaultProject;
  late List<String> projectList;
  late List<String> notificationList;
  late int numberOfTodo;
  late int numberOfDone;

  User({
    this.uid,
    required this.name,
    required this.email,
    required this.password,
    this.numberOfDone = 0,
    this.numberOfTodo = 0,
  }) {
    defaultProject = TodoProject(title: 'default');
    projectList = <String>[];
    notificationList = <String>[];
  }

  User.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  void fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    defaultProject = TodoProject.fromJson(json['defaultProject']);
    projectList = json['projectList'].cast<String>();
    notificationList = json['notificationList'].cast<String>();
    numberOfTodo = json['numberOfTodo'];
    numberOfDone = json['numberOfDone'];
  }

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'name': name,
    'email': email,
    'password': password,
    'defaultProject': defaultProject.toJson(),
    'projectList': projectList,
    'notificationList': notificationList,
    'numberOfTodo': numberOfTodo,
    'numberOfDone': numberOfDone,
  };
}
