class TodoNotification {
  String? id;
  String? title;
  String? description;
  bool read = false;
  bool deleted = false;
  DateTime occurrenceTime = DateTime(2000, 01, 01);

  TodoNotification(
    this.id,
    this.title,
    this.description,
    this.read,
    this.deleted,
    this.occurrenceTime,
  );

  TodoNotification.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  void fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    read = json['read'];
    deleted = json['deleted'];
    occurrenceTime = json['occurrenceTime'];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'read': read,
    'deleted': deleted,
    'occurrenceTime': occurrenceTime,
  };
}