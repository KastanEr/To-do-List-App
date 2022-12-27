import 'todo.dart';

class Project {
  int numberOfTodo = 0;
  late String title;
  List<dynamic> contnet = <dynamic>[];
  List<String> collaborator = <String>[];

  Project({
    String? title,
  }) : title = title ?? '제목 없음';

  Project.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  void fromJson(Map<String, dynamic> json) {
    title = json['title'];
    contnet = json['content'];
    collaborator = json['collaborator'];
  }

  Map<String, dynamic> toJson() => {
    
  };

  void addTodo(Todo newTodo) {
    contnet.add(newTodo);
    numberOfTodo++;
  }

  void deleteContent(int index) {
    if (index >= 0 && index < numberOfTodo) {
      contnet.removeAt(index);
    }
  }

  void addHeading(String newHeading) {
    contnet.add(newHeading);
  }

  void addCollaborator(String newUid) {
    collaborator.add(newUid);
  }
}