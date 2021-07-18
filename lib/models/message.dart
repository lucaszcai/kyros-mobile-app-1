import 'user.dart';

class Message {
  final User sender;
  final String text;
  final bool unread;

  Message({
    required this.sender,
    required this.text,
    required this.unread,
  });
}

final User me = User(
  id: 0,
  name: 'Me',
  imageUrl: 'assets/Me.jpg',
);
final User steeves = User(
  id: 1,
  name: 'Steeves',
  imageUrl: 'assets/Steeves.jpg',
);
final User stone = User(
  id: 2,
  name: 'Stone',
  imageUrl: 'assets/Stone.jpg',
);
final User andrews = User(
  id: 3,
  name: 'Andrews',
  imageUrl: 'assets/Andrews.jpg',
);
final User owens = User(
  id: 4,
  name: 'Owens',
  imageUrl: 'assets/Owens.jpg',
);
final User wright = User(
  id: 5,
  name: 'Wright',
  imageUrl: 'assets/Wright.jpg',
);
final User matthews = User(
  id: 6,
  name: 'Matthews',
  imageUrl: 'assets/Matthews.jpg',
);

List<Message> messages = [
  Message(
    sender: steeves,
    text: 'Hey how are you doing today, I am doing my homework',
    unread: true,
  ),
  Message(
    sender: stone,
    text: 'Hey how are you doing today, I\'m doing my homework',
    unread: false,
  ),
  Message(
    sender: andrews,
    text: 'Hey how are you doing today, I am doing my homework',
    unread: true,
  ),
  Message(
    sender: owens,
    text: 'Hey how are you doing today, I am doing my homework',
    unread: true,
  ),
  Message(
    sender: wright,
    text: 'Hey how are you doing today, I am doing my homework',
    unread: false,
  ),
  Message(
    sender: matthews,
    text: 'Hey how are you doing today, I am doing my homework',
    unread: true,
  ),
];


