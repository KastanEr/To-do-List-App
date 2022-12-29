class TodoProject {
  String? pid;
  late String title;
  List<String> content = <String>[];
  DateTime? deadLine;

  TodoProject({
    this.pid,
    String? title,
    this.deadLine,
  }) : title = title ?? '제목 없음';

  TodoProject.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  void fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    title = json['title'];
    content = json['content'].cast<String>();
    deadLine = json['deadline'];
  }

  Map<String, dynamic> toJson() => {
    'pid': pid,
    'title': title,
    'content': content,
    'deadline': deadLine,
  };

  void addHeading(String newHeading) {
    content.add('H:$newHeading');
  }
}