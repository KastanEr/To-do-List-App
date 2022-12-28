import 'todo.dart';

class TodoProject {
  String? pid;
  late String title;
  List<String> content = <String>[];
  int numberOfTodo = 0;
  int numberOfDone = 0;

  TodoProject({
    this.pid,
    String? title,
  }) : title = title ?? '제목 없음';

  TodoProject.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  void fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'].cast<String>();
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'content': content,
    'numberOfTodo': numberOfTodo,
  };

  void addTodo(String newTodoID) {
    content.add(newTodoID);
    numberOfTodo++;
  }

  void deleteContent(int index) {
    if (index >= 0 && index < numberOfTodo) {
      content.removeAt(index);
    }
  }

  void addHeading(String newHeading) {
    content.add(newHeading);
  }

  void addCollaborator(String newUid) {
  }

  void deleteCollaborator(String uid) {
  }
}