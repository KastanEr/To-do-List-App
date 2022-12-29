import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebasecontroller.dart';
import 'model/todo.dart';
import 'model/todoproject.dart';
import 'model/user.dart';

class LoginedUser {
  static User loginedUser = User(name: 'Guest', email: "", password: "");
  static List<TodoProject> projectList = <TodoProject>[];
  static List<Todo> todoList = <Todo>[];

  static updateProjectList() {
    List<TodoProject> projectList = <TodoProject>[];
    for (int i = 0; i < LoginedUser.loginedUser.projectList.length; i++) {
      var data;
      var docRef = FirebaseController.projectCollection
          .doc(LoginedUser.loginedUser.projectList[i]);
      docRef.get().then(
        (DocumentSnapshot doc) {
          data = doc.data() as Map<String, dynamic>;
          projectList.add(TodoProject.fromJson(data));
        },
        onError: (e) => print('$e'),
      );
    }
    LoginedUser.projectList = projectList;
  }

  static updateTodoList() {
    updateProjectList();
    List<Todo> todoList = <Todo>[];

    for(int i = 0; i < loginedUser.defaultProject.content.length; i++) {
      var data;
      var docRef = FirebaseController.todoCollection.doc(loginedUser.defaultProject.content[i]);
      docRef.get().then(
        (DocumentSnapshot doc) {
          data = doc.data() as Map<String, dynamic>;
          todoList.add(Todo.fromJson(data));
        },
        onError: (e) => print('$e'),
      );
    }
    for(int i = 0; i < projectList.length; i++) {
      for(int j = 0; j < projectList[i].content.length; j++) {
        var data;
        var docRef = FirebaseController.todoCollection.doc(projectList[i].content[j]);
        docRef.get().then(
          (DocumentSnapshot doc) {
            data = doc.data() as Map<String, dynamic>;
            todoList.add(Todo.fromJson(data));
          },
          onError: (e) => print('$e'),
        );
      }
    }
  }
}
