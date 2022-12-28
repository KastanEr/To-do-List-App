import 'project.dart';
import 'notification.dart';

class User {
  late String _uid; 
  late String _name;
  late String _email;
  late String _password;
  late String _position;
  late Project _default;
  late List<Project> _projectList;
  late List<Notification> _notificationList;
  late int _numberOfTodo;
  late int _numberOfDone;
}
