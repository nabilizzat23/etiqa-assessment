import 'package:cloud_firestore/cloud_firestore.dart';

//Todo model page to manipulate json data

class Todo {
  String id;
  final String title;
  final DateTime startdate;
  final DateTime enddate;

  Todo({
    this.id = '',
    required this.title,
    required this.startdate,
    required this.enddate,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'startdate': startdate,
        'enddate': enddate,
      };

  static Todo fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'],
        title: json['title'],
        startdate: (json['startdate'] as Timestamp).toDate(),
        enddate: (json['enddate'] as Timestamp).toDate(),
      );
}
