import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chatmodel.dart';
import 'package:whatsapp_clone/pages/chat_detail.dart';

class ChatTile extends StatelessWidget {
  ChatTile({Key? key, required this.chatdata}) : super(key: key);
  Chat chatdata;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(chatdata.name!),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetails(
              chatdata: chatdata,
            ),
          )),
      leading: CircleAvatar(
        backgroundImage: (chatdata.avatar == "")
            ? NetworkImage((chatdata.isGroup!)
                ? "https://cdn6.aptoide.com/imgs/1/2/2/1221bc0bdd2354b42b293317ff2adbcf_icon.png"
                : "https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg")
            : NetworkImage(chatdata.avatar!),
      ),
      subtitle: Text(chatdata.message!),
      trailing: Text(chatdata.updatedAt!),
    );
  }
}
