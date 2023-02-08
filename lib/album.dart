// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Todos {
  int id;
  int userId;
  String title;
  bool completed;
  Todos({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });
  

  Todos copyWith({
    int? id,
    int? userId,
    String? title,
    bool? completed,
  }) {
    return Todos(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'title': title,
      'completed': completed,
    };
  }

  factory Todos.fromMap(Map<String, dynamic> map) {
    return Todos(
      id: map['id'] as int,
      userId: map['userId'] as int,
      title: map['title'] as String,
      completed: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todos.fromJson(String source) => Todos.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Todos(id: $id, userId: $userId, title: $title, completed: $completed)';
  }

  @override
  bool operator ==(covariant Todos other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.userId == userId &&
      other.title == title &&
      other.completed == completed;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      userId.hashCode ^
      title.hashCode ^
      completed.hashCode;
  }
}
