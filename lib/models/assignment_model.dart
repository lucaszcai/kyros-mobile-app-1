import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Assignment {
  String title;
  String description;
  DateTime dueDate;

  // List<Comment> comments;
  // File? homeworkInput;
  bool completed;

  Assignment(
      {required this.title,
        required this.description,
        required this.dueDate,
        // required this.comments,
        // this.homeworkInput,
        required this.completed});

  factory Assignment.fromJson(Map<String, dynamic> json){
    // List<dynamic> commentMaps = json['comments'];
    //
    // List<Comment> convertedComments;
    // if(commentMaps != null){
    //   convertedComments = <Comment>[];
    //   commentMaps.forEach((comment){
    //     convertedComments.add(Comment.fromJson(comment));
    //   });
    // }

    return Assignment(
      title: json['title'],
      description: json['description'],
      dueDate: json['dateTime'],
      // comments: doc.get('comments'),
      // comments: convertedComments,
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toMap(){
    return{
      'title': title,
      'description': description,
      'dueDate': dueDate,
      // 'comments': comments,
      'completed': completed
    };
  }

  factory Assignment.fromDocument(DocumentSnapshot doc) {
    return Assignment(
      title: doc.get('title'),
      description: doc.get('description'),
      dueDate: DateTime.now(),
      // comments: doc.get('comments'),
      completed: doc.get('completed'),
      // comments: doc.collection('comments')
    );
  }
}
