import 'package:flutter_ui/models/user_model/user_model.dart';
import 'package:state_notifier/state_notifier.dart';

class ChatUserController extends StateNotifier<UserState> {
  ChatUserController() : super(const UserState());

  void dragAndDrop(
    int oldIndex,
    int newIndex,
    List chatUsers,
  ) {
    // 移動前のindexより移動後のindexが大きい場合、
    // itemの長さがlistの保有数よりも1大きくなってしまうため、
    // newIndexから1引く。
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final UserState reorderedChatUsers = chatUsers.removeAt(oldIndex);
    chatUsers.insert(newIndex, reorderedChatUsers);
  }
}
