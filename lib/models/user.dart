import 'contact_model.dart';

class KyrosUser {
  final int id;
  final String uid;
  final String name;
  final String imageUrl;
  Contact contact;
  List contacts;

  KyrosUser({
    required this.uid,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.contact,
    required this.contacts
  });
}