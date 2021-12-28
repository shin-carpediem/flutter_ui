// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_ui/main.dart';
import 'package:flutter_ui/screens/chat_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TalkTileWidget extends HookConsumerWidget {
  TalkTileWidget({this.icon, this.name, this.message});

  final IconData? icon;
  final String? name;
  final String? message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MypageState = ref.watch(MyPageProvider);

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.20,
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  MypageState.iconUrl ?? "https://picsum.photos/100",
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(MypageState.name ?? 'No title'),
          subtitle: Text(message ?? 'No subtitle'),
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
          iconWidget: Text(
            "Hide",
            style: TextStyle(color: Colors.white),
          ),
          onTap: () => {}, // _showSnackBar('More'),
        ),
        IconSlideAction(
          color: Colors.red,
          iconWidget: Text(
            "Delete",
            style: TextStyle(color: Colors.white),
          ),
          onTap: () => {}, // _showSnackBar('Delete'),
        ),
      ],
    );
  }
}
