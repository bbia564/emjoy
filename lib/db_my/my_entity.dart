import 'package:intl/intl.dart';

class MyEntity {
  int id;
  DateTime createdTime;
  int type;
  int pinned;
  DateTime pinnedTime;
  String content;

  MyEntity({
    required this.id,
    required this.createdTime,
    required this.type,
    required this.pinned,
    required this.pinnedTime,
    required this.content,
  });

  factory MyEntity.fromJson(Map<String, dynamic> json) {
    return MyEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      type: json['type'],
      pinned: json['pinned'],
      pinnedTime: DateTime.parse(json['pinnedTime']),
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'createdTime':createdTime.toIso8601String(),
      'type':type,
      'pinned':pinned,
      'pinnedTime':pinnedTime.toIso8601String(),
      'content':content,
    };
  }

  String get createdTimeYMDStr => DateFormat('yyyy-MM-dd').format(createdTime);

  String get createdTimeHMStr => DateFormat('h:mm a').format(createdTime);

  String get weekday {
    final weeks = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    final weekday = createdTime.weekday;
    return weeks[weekday - 1];
  }

}