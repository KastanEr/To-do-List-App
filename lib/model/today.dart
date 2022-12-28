import 'package:intl/intl.dart';
import 'todo.dart';

class Today {
  int numberOfTodo = 0;
  late int date;
  List<dynamic> content = <dynamic>[];

  Today({
    required int date,
  });

  String getToday() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('MM-dd');
    var strToday = formatter.format(now);
    return strToday;
  }

  Today.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  void fromJson(Map<String, dynamic> json) {
    date = json['date'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() => {

  };

  void addTodo(Todo newTodo) {
    content.add(newTodo);
    numberOfTodo++;
  }

  void deleteContent(int index) {
    if (index >= 0 && index < numberOfTodo) {
      content.removeAt(index);
    }
  }

}