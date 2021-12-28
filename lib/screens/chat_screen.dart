// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/main.dart';
import 'package:flutter_ui/widgets/chat/message_widget.dart';
import 'package:flutter_ui/widgets/chat/own_message_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChatState = ref.watch(ChatProvider);
    final ChatController = ref.read(ChatProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          ChatState.name ?? 'No name',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () => {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              icon: Icon(Icons.call),
              onPressed: () => {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              icon: Icon(Icons.dehaze),
              onPressed: () => {},
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: <Widget>[
            Flexible(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('chat')
                    .orderBy('created_at', descending: true)
                    .snapshots(),
                // builderはstreamが更新される度に呼ばれる
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  // dataが取れていない時の処理
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  return ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    reverse: true,
                    itemBuilder: (_, int index) {
                      DocumentSnapshot doc = snapshot.data!.docs[index];

                      bool isOwnMessage = false;
                      if (doc['name'] == ChatState.name) {
                        isOwnMessage = true;
                      }
                      return isOwnMessage
                          ? ownMessage(doc['message'], doc['name'])
                          : message(doc['message'], doc['name']);
                    },
                    itemCount: snapshot.data!.docs.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.camera_alt),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.photo),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.mic),
            ),
            // Expanded は余った余白を全て使う
            Expanded(
              child: TextField(
                controller: ChatController.chatController,
                onSubmitted: ChatController.handleSubmit,
                decoration: InputDecoration(
                  labelText: 'Input message',
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.send,
                color: Colors.blue,
              ),
              onPressed: () {
                ChatController.handleSubmit(ChatController.chatController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
