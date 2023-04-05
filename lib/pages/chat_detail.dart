import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chatmodel.dart';
import 'package:whatsapp_clone/widgets/utility_widget.dart';

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
              style: TextStyle(fontSize: 18),
            ),
            Text(
              widget.chatdata.status!,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        actions: [
          Icon(Icons.video_call),
          UtilityWidget().widthSpacer(10),
          Icon(Icons.call),
          UtilityWidget().widthSpacer(10),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text("View contacts")),
                PopupMenuItem(child: Text("Media,link,and docs")),
                PopupMenuItem(child: Text("Search")),
                PopupMenuItem(child: Text("Mute notification")),
                PopupMenuItem(child: Text("Disappearing messages")),
                PopupMenuItem(child: Text("Wallpapper")),
                PopupMenuItem(child: InkWell(child: Text("More"))),
              ];
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              "https://i.pinimg.com/736x/8c/98/99/8c98994518b575bfd8c949e91d20548b.jpg",
              fit: BoxFit.cover,
            ),
          ),
          ListView.builder(itemBuilder: (context, index) {
            return Text("hello");
          },)
        ],
      ),
    );
  }
}
