// ignore_for_file: non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/main.dart';
import 'package:flutter_ui/widgets/chat/message_widget.dart';
import 'package:flutter_ui/widgets/chat/own_message_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChatState = ref.watch(ChatProvider);
    final ChatController = ref.read(ChatProvider.notifier);

    // final dynamic uid = FirebaseAuth.instance.currentUser!.uid;
    // final snapshot =
    //     FirebaseFirestore.instance.collection('users').doc(uid).get();
    // print(snapshot);
    // final data = snapshot.data();
    // final dynamic partnerId = data?['partnerId'];
    // print(partnerId);
    // final partnerSnapshot =
    //     FirebaseFirestore.instance.collection('users').doc(partnerId).get();

    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   partnerSnapshot.name ?? 'No name',
        // ),
        title: const Text('No name'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              icon: const Icon(Icons.call),
              onPressed: () => {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              icon: const Icon(Icons.dehaze),
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
                    // .where('partnerUid', isEqualTo: partnerSnapshot.partnerUid)
                    .orderBy('created_at', descending: true)
                    .snapshots(),
                // builderはstreamが更新される度に呼ばれる
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    reverse: true,
                    itemBuilder: (_, int index) {
                      DocumentSnapshot doc = snapshot.data!.docs[index];

                      bool isOwnMessage = false;
                      if (doc['userRef'] == ChatState.userRef) {
                        isOwnMessage = true;
                      }
                      return isOwnMessage
                          ? ownMessage(doc['message'])
                          : message(doc['message']);
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
              icon: const Icon(Icons.camera_alt),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.photo),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.mic),
            ),
            // Expanded は余った余白を全て使う
            Expanded(
              child: TextField(
                controller: ChatController.chatController,
                onSubmitted: ChatController.handleSubmit,
                decoration: const InputDecoration(
                  labelText: 'Input message',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
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
