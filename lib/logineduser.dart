import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebasecontroller.dart';
import 'model/todoproject.dart';
import 'model/user.dart';

class LoginedUser {
  static User loginedUser = User(name: 'Guest', email: "", password: "");
  static List<TodoProject> projectList = <TodoProject>[];
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
}
