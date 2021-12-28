// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({
    this.name,
  });
  final String? name;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name ?? 'No name',
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
                      if (doc['name'] == widget.name) {
                        isOwnMessage = true;
                      }
                      return isOwnMessage
                          ? _ownMessage(doc['message'], doc['name'])
                          : _message(doc['message'], doc['name']);
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
                controller: _controller,
                onSubmitted: _handleSubmit,
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
                _handleSubmit(_controller.text);
              },
            ),
          ],
        ),
      ),
    );
  }

  _handleSubmit(String message) async {
    _controller.text = "";
    await FirebaseFirestore.instance.collection('chat').add({
      'name': widget.name,
      'message': message,
      'created_at': DateTime.now(),
    }).then((val) {
      // for test
    }).catchError((err) {
      throw "error";
    });
  }

  Widget _ownMessage(String message, String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10.0),
            Text(name),
            Text(message),
          ],
        ),
        Padding(
            padding:
                EdgeInsets.only(left: 4.0, right: 4.0, top: 8.0, bottom: 8.0)),
        Icon(Icons.person),
      ],
    );
  }

  Widget _message(String message, String name) {
    return Row(
      children: <Widget>[
        Icon(Icons.person),
        Padding(
            padding:
                EdgeInsets.only(left: 4.0, right: 4.0, top: 8.0, bottom: 8.0)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10.0),
            Text(name),
            Text(message),
          ],
        ),
      ],
    );
  }
}
