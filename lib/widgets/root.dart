// ignore_for_file: non_constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ui/routes/home_route.dart';
import 'package:flutter_ui/routes/news_route.dart';
import 'package:flutter_ui/routes/talk_route.dart';
import 'package:flutter_ui/routes/timeline_route.dart';
import 'package:flutter_ui/routes/wallet_route.dart';

class RootWidget extends StatefulWidget {
  const RootWidget({Key? key}) : super(key: key);

  @override
  _Footer createState() => _Footer();
}

class _Footer extends State<RootWidget> {
  int _selectedIndex = 0;
  final _bottomNavigationBarItems = <BottomNavigationBarItem>[];

  // アイコン情報
  static const _footerIcons = [
    Icons.home,
    Icons.textsms,
    Icons.access_time,
    Icons.content_paste,
    Icons.work,
  ];

  // アイコン文字列
  static const _footerItemNames = [
    'Home',
    'Talk',
    'Timeline',
    'News',
    'Wallet',
  ];

  var _routes = [
    Home(),
    Talk(),
    TimeLine(),
    News(),
    Wallet(),
  ];

  @override
  void initState() {
    super.initState();
    _bottomNavigationBarItems.add(_UpdateActiveState(0));
    for (var i = 1; i < _footerItemNames.length; i++) {
      _bottomNavigationBarItems.add(_UpdateActiveState(i));
    }
  }

  // indexのitemをactivateする
  BottomNavigationBarItem _UpdateActiveState(int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        _footerIcons[index],
        color: Colors.blue[700],
      ),
      label: _footerItemNames[index],
    );
  }

  // indexのitemをdeactivateする
  BottomNavigationBarItem _UpdateDeactiveState(int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        _footerIcons[index],
        color: Colors.blue[300],
      ),
      label: _footerItemNames[index],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _bottomNavigationBarItems[_selectedIndex] =
          _UpdateActiveState(_selectedIndex);
      _bottomNavigationBarItems[index] = _UpdateDeactiveState(index);
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bodyは選択されたiconによって変更
      body: _routes.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // これを書かないと表示がおかしくなる
        items: _bottomNavigationBarItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
