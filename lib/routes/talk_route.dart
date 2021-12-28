// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/talk_tile_widget.dart';

class Talk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Talk'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          TalkTileWidget(),
          TalkTileWidget(),
          TalkTileWidget(),
          TalkTileWidget(),
          TalkTileWidget(),
          TalkTileWidget(),
          TalkTileWidget(),
          TalkTileWidget(),
          TalkTileWidget(),
          TalkTileWidget(),
          TalkTileWidget(),
          TalkTileWidget(),
          TalkTileWidget(),
          TalkTileWidget(),
          TalkTileWidget(),
          TalkTileWidget(),
          TalkTileWidget(),
          TalkTileWidget(),
        ],
      ),
    );
  }
}