import 'package:kyros_app_mobile/models/message.dart';
import 'package:kyros_app_mobile/models/user.dart';

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

List base_contacts = [
  me.contact,
  steeves.contact,
  stone.contact,
  andrews.contact,

];

List AllKyrosUsers = [
  me.contact,
  steeves.contact,
  stone.contact,
  andrews.contact,
  owens.contact,
  wright.contact,
  matthews.contact
];


List favoriteContacts = [];

List current_user_contacts = me.contacts;


