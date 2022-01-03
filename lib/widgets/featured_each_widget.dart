import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/icon_logo_widget.dart';

List<Widget> featuredEachWidget(snapshot) {
  List<Widget> items = [];
  final int lengths = snapshot.data!.docs.length;
  List<int> lengthList = [];
  for (int i = 0; i < lengths; i++) {
    lengthList.add(i);
  }
  for (var index in lengthList) {
    DocumentSnapshot doc = snapshot.data!.docs[index];
    final widget = Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 24),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 32,
              ),
              child: SizedBox(
                width: 320,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      doc['title'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      doc['subtitle'],
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: IconLogo(
            size: 48,
            url: doc['logoUrl'],
          ),
        ),
      ],
    );
    items.add(widget);
  }

  return items;
}
