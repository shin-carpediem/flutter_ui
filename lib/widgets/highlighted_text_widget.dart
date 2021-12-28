// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

// TODO: ハイライトされてない
class HighlightedText extends StatelessWidget {
  HighlightedText({
    this.wholeString,
    this.highlightedString,
    this.defaultStyle = const TextStyle(color: Colors.black),
    this.highlightStyle = const TextStyle(color: Colors.blue),
  });

  final String? wholeString;
  final String? highlightedString;
  final TextStyle defaultStyle;
  final TextStyle highlightStyle;

  int get _highlightStart {
    if (wholeString != null && highlightedString != null) {
      return wholeString!
          .toLowerCase()
          .indexOf(highlightedString!.toLowerCase());
    } else {
      return 0;
    }
  }

  int get _highlightEnd {
    if (wholeString != null && highlightedString != null) {
      return _highlightStart + highlightedString!.length;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    // indexOf()は該当する要素が見つからない場合「-1」を返す。
    // 検索キーワードを含んでいないので、ハイライトされていない素のテキストを表示。
    if (_highlightStart == -1) {
      return Text(
        wholeString!,
        style: defaultStyle,
      );
    }
    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: [
          TextSpan(text: wholeString!.substring(0, _highlightStart)),
          TextSpan(
            text: wholeString!.substring(_highlightStart, _highlightEnd),
            style: highlightStyle,
          ),
          TextSpan(text: wholeString!.substring(_highlightEnd)),
        ],
      ),
    );
  }
}
