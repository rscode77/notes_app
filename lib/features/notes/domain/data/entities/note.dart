import 'dart:convert';

class Note {
  final String date;
  final String description;
  final int? id;
  final String noteStatus;
  final String time;
  final String title;

  const Note({
    required this.date,
    required this.description,
    required this.id,
    required this.noteStatus,
    required this.time,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'description': description,
      'id': id,
      'noteStatus': noteStatus,
      'time': time,
      'title': title,
    };
  }

  String toJson() => json.encode(toMap());
}
