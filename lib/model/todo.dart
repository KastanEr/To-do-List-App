class Todo {
  String? tid;
  late String title;
  late String description;
  DateTime? deadLine;
  // DateTime? finalDeadLine; 
  late bool done;
  late bool important;

  Todo({
    this.tid,
    String? title,
    String? description,
    this.deadLine,
    // this.finalDeadLine,
    this.done = false,
    this.important = false,
  }) : title = title ?? '제목 없음', description = description ?? '';

  Todo.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  void fromJson(Map<String, dynamic> json) {
    tid = json['tid'];
    title = json['title'];
    description = json['description'];
    // deadLine = DateTime.parse(json['deadLine']);
    // finalDeadLine = DateTime.parse(json['finalDeadLine']);
    done = json['done'];
    important = json['important'];
  }

  Map<String, dynamic> toJson() => {
    'tid': tid,
    'title': title,
    'description': description,
    // 'deadLine': deadLine,
    // 'finalDeadLine': finalDeadLine,
    'done': done,
    'important': important,
  };

  void toggleDone() => done = !done;
  
  void toggleImportant() => important = !important;
}