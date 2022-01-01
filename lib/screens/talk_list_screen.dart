import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_ui/core/chat_user_domain.dart';
import 'package:flutter_ui/models/chat_uesr_model/chat_user_model.dart';
import 'package:flutter_ui/screens/chat_screen.dart';
// import 'package:flutter_ui/widgets/talk_tile_widget.dart';
import 'package:provider/provider.dart';

class Talk extends StatelessWidget {
  const Talk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Talk'),
      ),
      body: Consumer<ChatUser>(builder: (context, model, child) {
        final List<ChatUserModel>? chatUsers = model.chatUsers;

        if (chatUsers == null) {
          return const CircularProgressIndicator();
        }

        final List<Widget> widgets = chatUsers
            .map((chatUser) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Slidable(
                    actionPane: const SlidableDrawerActionPane(),
                    actionExtentRatio: 0.20,
                    child: Consumer<ChatUser>(builder: (context, model, child) {
                      return Container(
                        color: Colors.white,
                        child: ListTile(
                          key: key,
                          leading: CircleAvatar(
                            child: Image.network(
                              // TODO: 表示されない
                              chatUser.iconUrl,
                              fit: BoxFit.contain,
                              errorBuilder: (c, o, s) {
                                return const Icon(
                                  Icons.error,
                                  color: Colors.black45,
                                );
                              },
                            ),
                          ),
                          title: Text(chatUser.name),
                          subtitle: Text(chatUser.desc),
                          // subtitle: const Text('No subtitle'),
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatScreen(),
                                ))
                          },
                        ),
                      );
                    }),
                    actions: <Widget>[
                      IconSlideAction(
                        color: Colors.blue,
                        icon: Icons.flash_off,
                        onTap: () => {}, // _showSnackBar('Archive'),
                      ),
                      IconSlideAction(
                        color: Colors.indigo,
                        icon: Icons.volume_off,
                        onTap: () => {}, // _showSnackBar('Share'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        color: Colors.black45,
                        iconWidget: const Text(
                          "Hide",
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () => {}, // _showSnackBar('More'),
                      ),
                      IconSlideAction(
                        color: Colors.red,
                        iconWidget: const Text(
                          "Delete",
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () => {}, // _showSnackBar('Delete'),
                      ),
                    ],
                  ),
                ))
            .toList();

        return ListView(
          children: widgets,
        );
      }),
    );
  }
}
