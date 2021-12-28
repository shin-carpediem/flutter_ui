// ignore_for_file: non_constant_identifier_names, prefer_final_fields
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ui/screens/routes/news_screen.dart';
import 'package:flutter_ui/screens/routes/talk_screen.dart';
import 'package:flutter_ui/screens/routes/notice_screen.dart';
import 'package:flutter_ui/screens/routes/wallet_screen.dart';
import 'package:flutter_ui/screens/top_page.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  _Footer createState() => _Footer();
}

class _Footer extends State<Footer> {
  int _selectedIndex = 0;
  final _bottomNavigationBarItems = <BottomNavigationBarItem>[];

  // アイコン情報
  static const _footerIcons = [
    Icons.home,
    Icons.textsms,
    Icons.notifications,
    Icons.content_paste,
    Icons.work,
  ];

  // アイコン文字列
  static const _footerItemNames = [
    'Home',
    'Talk',
    'Notice',
    'News',
    'Wallet',
  ];

  var _routes = [
    TopPage(),
    Talk(),
    Notice(),
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
