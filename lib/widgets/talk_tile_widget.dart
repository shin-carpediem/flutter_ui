// // ignore_for_file: non_constant_identifier_names

// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:flutter_ui/main.dart';
// import 'package:flutter_ui/models/chat_uesr_model/chat_user_model.dart';
// import 'package:flutter_ui/screens/chat_screen.dart';
// import 'package:provider/provider.dart';

// class TalkTileWidget extends StatelessWidget {
//   const TalkTileWidget({Key? key, this.message}) : super(key: key);

//   final String? message;

//   @override
//   Widget build(BuildContext context) {
//     return Slidable(
//       actionPane: const SlidableDrawerActionPane(),
//       actionExtentRatio: 0.20,
//       child: Consumer<ChatUser>(
//         builder: (context, model, child) {
//           return Container(
//             color: Colors.white,
//             child: ListTile(
//               key: key,
//               leading: Container(
//                 width: 50,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   image: DecorationImage(
//                     image: NetworkImage(
//                       model.iconUrl ?? "https://picsum.photos/100",
//                     ),
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//               title: Text(MypageState.name ?? 'No title'),
//               subtitle: Text(message ?? 'No subtitle'),
//               onTap: () => {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ChatScreen(),
//                     ))
//               },
//             ),
//           );
//         }
//       ),
//       actions: <Widget>[
//         IconSlideAction(
//           color: Colors.blue,
//           icon: Icons.flash_off,
//           onTap: () => {}, // _showSnackBar('Archive'),
//         ),
//         IconSlideAction(
//           color: Colors.indigo,
//           icon: Icons.volume_off,
//           onTap: () => {}, // _showSnackBar('Share'),
//         ),
//       ],
//       secondaryActions: <Widget>[
//         IconSlideAction(
//           color: Colors.black45,
//           iconWidget: const Text(
//             "Hide",
//             style: TextStyle(color: Colors.white),
//           ),
//           onTap: () => {}, // _showSnackBar('More'),
//         ),
//         IconSlideAction(
//           color: Colors.red,
//           iconWidget: const Text(
//             "Delete",
//             style: TextStyle(color: Colors.white),
//           ),
//           onTap: () => {}, // _showSnackBar('Delete'),
//         ),
//       ],
//     );
//   }
// }
