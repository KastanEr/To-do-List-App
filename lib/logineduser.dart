import 'model/todo.dart';
import 'model/todoproject.dart';
import 'model/user.dart';

class LoginedUser {
  static User loginedUser = User(name: 'Guest', email: "", password: "");
  static Map<String, TodoProject> projects = {};
  static Map<String, Todo> todos = {};
}
