class Assignment {
  final String title;
  final String description;
  final DateTime dueDate;
  final int numComments;
  final List<String> comments;
  String homeworkInput;
  bool completed;

  Assignment(
      this.title,
      this.description,
      this.dueDate,
      this.numComments,
      this.comments,
      this.homeworkInput,
      this.completed
  );

}

List<Assignment> assignments = [
  Assignment('Assignment title #1', 'lorem lorem lorem', DateTime.utc(2021, 1, 1), 0, ['comments'], '', false),
  Assignment('Assignment title #2', 'lorem lorem lorem', DateTime.utc(2021, 1, 2), 0, ['comments'], '', false),
  Assignment('Assignment title #3', 'lorem lorem lorem', DateTime.utc(2021, 1, 3), 0, ['comments'], '', false),
  Assignment('Assignment title #4', 'lorem lorem lorem', DateTime.utc(2021, 1, 4), 0, ['comments'], '', false),
  Assignment('Assignment title #5', 'lorem lorem lorem', DateTime.utc(2021, 1, 5), 0, ['comments'], '', false),
  Assignment('Assignment title #6', 'lorem lorem lorem', DateTime.utc(2021, 1, 6), 0, ['comments'], '', false),
  Assignment('Assignment title #7', 'lorem lorem lorem', DateTime.utc(2021, 1, 7), 0, ['comments'], '', true),
  Assignment('Assignment title #8', 'lorem lorem lorem', DateTime.utc(2021, 1, 8), 0, ['comments'], '', true),
  Assignment('Assignment title #9', 'lorem lorem lorem', DateTime.utc(2021, 1, 9), 0, ['comments'], '', true),
];
