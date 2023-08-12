

import 'dart:convert';

List<Todomodele> todomodeleFromJson(String str) => List<Todomodele>.from(json.decode(str).map((x) => Todomodele.fromJson(x)));

String todomodeleToJson(List<Todomodele> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todomodele {
    int? userId;
    int? id;
    String? title;
    bool? completed;

    Todomodele({
        this.userId,
        this.id,
        this.title,
        this.completed,
    });

    factory Todomodele.fromJson(Map<String, dynamic> json) => Todomodele(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}
