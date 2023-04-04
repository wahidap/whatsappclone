import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chatmodel.dart';

class ChatDetails extends StatefulWidget {
  ChatDetails({super.key, required this.chatdata});
  Chat chatdata;

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leadingWidth: 80,
        leading: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back),
            ),
            CircleAvatar(
              backgroundImage: (widget.chatdata.avatar == "")
                  ? NetworkImage((widget.chatdata.isGroup!)
                      ? "https://cdn6.aptoide.com/imgs/1/2/2/1221bc0bdd2354b42b293317ff2adbcf_icon.png"
                      : "https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg")
                  : NetworkImage(widget.chatdata.avatar!),
            ),
            
          ],
        ),
        title: Column(
          children: [
            Text(
              widget.chatdata.name!,
              style: TextStyle(fontSize: 26),
            ),
            Text(widget.chatdata.status!),
          ],
        ),
      ),
    );
  }
}
