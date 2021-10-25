// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_ui/app_theme.dart';

class Header extends StatelessWidget {
  final String title;

  const Header({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 80,
        ),
        // TODO: provider を使って、ダークモード切り替えができるようになる
        // SwitchListTile(
        //   title: Text('Theme'),
        //   subtitle: Text('Light/Dark'),
        //   value: false,
        //   onChanged: (bool value) {},
        //   // value: fl.darkFlag,
        //   // onChanged: (bool value) {
        //   //   setState(() {
        //   //     // スイッチを切り替えるために状態変化
        //   //     fl.darkFlag = value;
        //   //   });
        //   //   // テーマの切り替え
        //   //   Provider.of<AppTheme>(
        //   //     context,
        //   //     listen: false,
        //   //   ).changeMode();
        //   //   Save.saveFlag(fl); // 状態を保存する
        //   // },
        //   // secondary: Icon(
        //   //   FontAwesomeIcons.glasses,
        //   //   color: Colors.black54,
        //   // ),
        // ),
      ],
    );
  }
}
