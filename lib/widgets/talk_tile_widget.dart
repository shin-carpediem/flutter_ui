import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_ui/screens/chat_screen.dart';

Widget talkTileWidget(doc, context) {
  return Slidable(
    actionPane: const SlidableDrawerActionPane(),
    actionExtentRatio: 0.20,
    child: Container(
      color: Colors.white,
      child: ListTile(
        // key: key,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(doc['iconUrl']),
        ),
        title: Text(doc['name']),
        subtitle: Text(doc['desc']),
        // subtitle: const Text('No subtitle'),
        onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(),
              ))
        },
      ),
    ),
    actions: <Widget>[
      IconSlideAction(
        color: Colors.blue,
        icon: Icons.flash_off,
        onTap: () => {}, // _showSnackBar('Archive'),
      ),
      IconSlideAction(
        color: Colors.indigo,
        icon: Icons.volume_off,
        onTap: () => {}, // _showSnackBar('Share'),
      ),
    ],
    secondaryActions: <Widget>[
      IconSlideAction(
        color: Colors.black45,
        iconWidget: const Text(
          "Hide",
          style: TextStyle(color: Colors.white),
        ),
        onTap: () => {}, // _showSnackBar('More'),
      ),
      IconSlideAction(
        color: Colors.red,
        iconWidget: const Text(
          "Delete",
          style: TextStyle(color: Colors.white),
        ),
        onTap: () => {}, // _showSnackBar('Delete'),
      ),
    ],
  );
}
