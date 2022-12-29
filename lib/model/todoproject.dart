class TodoProject {
  String? pid;
  late String title;
  List<String> content = <String>[];

  TodoProject({
    this.pid,
    String? title,
  }) : title = title ?? '제목 없음';

  TodoProject.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  void fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    title = json['title'];
    content = json['content'].cast<String>();
  }

  Map<String, dynamic> toJson() => {
    'pid': pid,
    'title': title,
    'content': content,
  };

  void addHeading(String newHeading) {
    content.add(newHeading);
  }
}