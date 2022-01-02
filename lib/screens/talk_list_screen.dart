import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/talk_tile_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Talk extends HookConsumerWidget {
  const Talk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Talk'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (_, int index) {
              DocumentSnapshot doc = snapshot.data!.docs[index];
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: talkTileWidget(doc, context),
              );
            },
          );
        },
      ),
    );
  }
}
