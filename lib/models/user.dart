import 'contact_model.dart';

class User {
  final int id;
  final String name;
  final String imageUrl;
  Contact contact;
  List contacts;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.contact,
    required this.contacts
  });
}