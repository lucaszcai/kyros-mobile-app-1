// TODO Implement this library.
// NOTE: This file makes a custom Widget based off of the ExpansionTile widget

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotificationScreenListTile extends StatelessWidget {
  // require title and description parameters
  NotificationScreenListTile({required this.title, required this.description});

  final String title;
  final String description;

  // build a custom ExpansionTile
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.15,
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.indigoAccent,
            child: Text('Pic'),
            foregroundColor: Colors.white,
          ),
          title: Text('Notification'),
          subtitle: Text('Caption'),
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          color: Colors.black45,
          icon: Icons.star,
        ),
        IconSlideAction(
          color: Colors.red,
          icon: Icons.delete,
        ),
      ],
    );
  }
}
