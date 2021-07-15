class Comment {
  final String name;
  String description;
  DateTime date;
  int replies;

  Comment(
      this.name,
      this.description,
      this.date,
      this.replies
      );
}

List<Comment> comments = [
  Comment('username','lorem lorem lorem lorem', DateTime.utc(2021, 1, 1), 0),
  Comment('username','lorem lorem lorem lorem', DateTime.utc(2021, 1, 1), 0),
  Comment('username','lorem lorem lorem lorem', DateTime.utc(2021, 1, 1), 0),
];
