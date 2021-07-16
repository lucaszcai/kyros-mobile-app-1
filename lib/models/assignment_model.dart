import 'assignment_comment_model.dart';

class Assignment {
  final String title;
  final String description;
  final DateTime dueDate;
  final List<Comment> comments;
  String homeworkInput;
  bool completed;

  Assignment(
      this.title,
      this.description,
      this.dueDate,
      this.comments,
      this.homeworkInput,
      this.completed
  );

  void addComment(Comment comment) {
    this.comments.add(comment);
  }

}

List<Assignment> assignments = [
  Assignment('Assignment title #1', 'lorem lorem lorem', DateTime.utc(2021, 1, 1), [Comment('username','lorem lorem lorem lorem', DateTime.utc(2021, 1, 1), 0),], '', false),
  Assignment('Assignment title #2', 'lorem lorem lorem', DateTime.utc(2021, 1, 2), [Comment('username','lorem lorem lorem lorem', DateTime.utc(2021, 1, 1), 0),], '', false),
  Assignment('Assignment title #3', 'lorem lorem lorem', DateTime.utc(2021, 1, 3), [Comment('username','lorem lorem lorem lorem', DateTime.utc(2021, 1, 1), 0),], '', false),
  Assignment('Assignment title #4', 'lorem lorem lorem', DateTime.utc(2021, 1, 4), [Comment('username','lorem lorem lorem lorem', DateTime.utc(2021, 1, 1), 0),], '', false),
  Assignment('Assignment title #5', 'lorem lorem lorem', DateTime.utc(2021, 1, 5), [Comment('username','lorem lorem lorem lorem', DateTime.utc(2021, 1, 1), 0),], '', false),
  Assignment('Assignment title #6', 'lorem lorem lorem', DateTime.utc(2021, 1, 6), [Comment('username','lorem lorem lorem lorem', DateTime.utc(2021, 1, 1), 0),], '', false),
  Assignment('Assignment title #7', 'lorem lorem lorem', DateTime.utc(2021, 1, 7), [Comment('username','lorem lorem lorem lorem', DateTime.utc(2021, 1, 1), 0),], '', true),
  Assignment('Assignment title #8', 'lorem lorem lorem', DateTime.utc(2021, 1, 8), [Comment('username','lorem lorem lorem lorem', DateTime.utc(2021, 1, 1), 0),], '', true),
  Assignment('Assignment title #9', 'lorem lorem lorem', DateTime.utc(2021, 1, 9), [Comment('username','lorem lorem lorem lorem', DateTime.utc(2021, 1, 1), 0),], '', true),
];
