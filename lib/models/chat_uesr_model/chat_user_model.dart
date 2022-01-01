import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/core/chat_user_domain.dart';

class ChatUser extends ChangeNotifier {
  List<ChatUserModel>? chatUsers;

  void fetchChatUser() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').get();

    final List<ChatUserModel> chatUsers =
        snapshot.docs.map((DocumentSnapshot doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      final String id = doc.id;
      final String key = id.toString();
      final String name = data['name'];
      final String email = data['email'];
      final String desc = data['desc'];
      final String logoUrl = data['logoUrl'];

      return ChatUserModel(
        id,
        key,
        name,
        email,
        desc,
        logoUrl,
      );
    }).toList();

    this.chatUsers = chatUsers;
    notifyListeners();
  }

  void dragAndDrop(
    int oldIndex,
    int newIndex,
    List<ChatUserModel> chatUsers,
  ) {
    // 移動前のindexより移動後のindexが大きい場合、
    // itemの長さがlistの保有数よりも1大きくなってしまうため、
    // newIndexから1引く。
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final ChatUserModel reorderedChatUsers = chatUsers.removeAt(oldIndex);
    chatUsers.insert(newIndex, reorderedChatUsers);
    notifyListeners();
  }
}
