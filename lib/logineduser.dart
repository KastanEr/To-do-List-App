import 'model/todo.dart';
import 'model/todoproject.dart';
import 'model/user.dart';

class LoginedUser {
  static User loginedUser = User(name: 'Guest', email: "", password: "");
  static Map<String, TodoProject> projects = {};
  static Map<String, Todo> todos = {};

  static List<Todo> usersTodos () {
    List<Todo> result = <Todo>[];
    for(int i = 0; i < loginedUser.projectList.length; i++) {
      for(int j = 0; j < projects[loginedUser.projectList[i]]!.content.length; j++) {
        if(todos[projects[loginedUser.projectList[i]]!.content[j]] != null) {
          result.add(todos[projects[loginedUser.projectList[i]]!.content[j]]!);
        }
      }
    }
    return result;
  }
}
