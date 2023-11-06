import 'package:todo_app_v1/core/utiles/extract_date.dart';

class TaskModel {
  String? id;
  String title;
  String description;
  DateTime time;
  bool isDone;


  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.isDone,
  });

  Map<String,dynamic> toFirestore() {
    return {
      "id" : id,
      "title" : title,
      "description" : description,
      "time" : ExtractDate.extractDate(time).millisecondsSinceEpoch,
      "isDone" : isDone,


    };

  }

  factory TaskModel.fromFirestore(Map<String,dynamic> json) {
    return TaskModel(
        id: json["id"],
        title: json["title"],
        description: json ["description"],
        time: DateTime.fromMillisecondsSinceEpoch(json["time"]),
        isDone: json["isDone"],

    );
  }
}
