
class Todo {
  String? id;
  late String title;
  late String description;
  DateTime? deadLine;
  DateTime? finalDeadLine; 
  late bool done;
  late bool important;

  Todo({
    this.id,
    String? title,
    String? description,
    this.deadLine,
    this.finalDeadLine,
    this.done = false,
    this.important = false,
  }) : this.title = title ?? '제목 없음', this.description = description ?? '';

  Todo.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  void fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    deadLine = json['deadLine'];
    finalDeadLine = json['finalDeadLine'];
    done = json['done'];
    important = json['important'];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'deadLine': deadLine,
    'finalDeadLine': finalDeadLine,
    'done': done,
    'important': important,
  };

  void toggleDone() => done = !done;
  void toggleImportant() => important = !important;
}