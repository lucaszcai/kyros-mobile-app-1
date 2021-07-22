class Contact {
  String name;
  String role;
  String description;
  final String Image_URL;

  Contact({
    required this.name,
    required this.role,
    required this.description,
    required this.Image_URL,

  });
}

List contacts = [
  Contact(name: "jeff", role: "manager", description: "hello, how are you doing", Image_URL: 'assets/Me.jpg'),



];

List AllKyrosUsers = [
  Contact(name: "jeff", role: "manager", description: "hello, how are you doing", Image_URL: 'assets/Me.jpg'),
  Contact(name: "joe", role: "student", description: "hello, how are you doing", Image_URL: 'assets/Steeves.jpg'),
  Contact(name: "nellie", role: "manager", description: "hello, how are you doing", Image_URL: 'assets/Stone.jpg'),
  Contact(name: "bob", role: "student", description: "hello, how are you doing", Image_URL: 'assets/Andrews.jpg'),
  Contact(name: "daren", role: "student", description: "hello, how are you doing", Image_URL: 'assets/Owens.jpg'),
  Contact(name: "jim", role: "manager", description: "hello, how are you doing", Image_URL: 'assets/Wright.jpg'),
  Contact(name: "joey", role: "student", description: "hello, how are you doing", Image_URL: 'assets/Matthews.jpg'),
];


List favoriteContacts = [];


