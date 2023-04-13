
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chatmodel.dart';
import 'package:whatsapp_clone/models/singlechat_model.dart';
import 'package:whatsapp_clone/pages/chatbubble.dart';
import 'package:whatsapp_clone/widgets/utility_widget.dart';

class ChatDetails extends StatefulWidget {
  ChatDetails({super.key, required this.chatdata});
  Chat chatdata;

  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  List<SingleChat> messageList = [
    SingleChat(isReaded: true, isSend: true, message: "blah", sendAt: "8.00am"),
    SingleChat(
        isReaded: false, isSend: false, message: "blah", sendAt: "8.00am"),
    SingleChat(isReaded: true, isSend: true, message: "blah", sendAt: "8.00am"),
    SingleChat(
        isReaded: false, isSend: false, message: "blah", sendAt: "8.00am"),
    SingleChat(isReaded: true, isSend: true, message: "blah", sendAt: "8.00am"),
    SingleChat(
        isReaded: false, isSend: false, message: "blah", sendAt: "8.00am"),
    SingleChat(
        isReaded: false, isSend: true, message: "blah", sendAt: "8.00am"),
  ];
  bool showSend = false;
  bool showEmoji = true;
  TextEditingController messageController = TextEditingController();
  FocusNode focusNode = FocusNode();
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
      body: Container(
        child: Stack(
          children: [
            Image.network(
              "https://i.pinimg.com/736x/8c/98/99/8c98994518b575bfd8c949e91d20548b.jpg",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            ListView.builder(
              itemCount: messageList.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  message: messageList[index],
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 70,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35)),
                        child: TextField(
                          focusNode: focusNode,
                          controller: messageController,
                          onTap: () {
                            if (!showEmoji) {
                              setState(() {
                                showEmoji = true;
                              });
                            }
                          },
                          onChanged: (value) {
                            if (value.length > 0) {
                              setState(() {
                                showSend = true;
                              });
                            } else {
                              setState(() {
                                showSend = false;
                              });
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              onPressed: () {
                                if (showEmoji) {
                                  FocusScope.of(context).unfocus();
                                }
                                setState(() {
                                  showEmoji = !showEmoji;
                                });
                              },
                              icon: (showEmoji)
                                  ? const Icon(Icons.emoji_emotions_outlined,color: Colors.teal)
                                  : const Icon(Icons.keyboard,color: Colors.teal),
                            ),
                            border: InputBorder.none,
                            hintText: "message",
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () => showModalBottomSheet(
                                          context: context,
                                          builder: (context) => bottomMenu(),
                                        ),
                                    icon: Icon(Icons.attach_file,color: Colors.teal)),
                                Icon(Icons.currency_rupee_rounded,color: Colors.teal),
                                Icon(Icons.camera_alt,color: Colors.teal),
                                UtilityWidget().widthSpacer(9),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 2),
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              messageList.add(
                                SingleChat(
                                  isReaded: false,
                                  isSend: true,
                                  message: messageController.text,
                                  sendAt: "5.00am",
                                ),
                              );
                            });
                            messageController.clear();
                          },
                          child:
                              (showSend)?Icon(Icons.send,) : Icon(Icons.mic,),
                        ),
                      )
                    ],
                  ),

                  Offstage(
                    offstage: showEmoji,
                    child: SizedBox(
                      height: 300,

                    //   child: EmojiPicker(
                        
                    //     onEmojiSelected:(emoji, category) {
                    //   setState(() {
                    //     showSend = true;
                    //   });
                    // }, )
                     ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container bottomMenu() {
    return Container(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),width: 300, height: 300,
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              menuIcon(text: "Document", icon: Icon(Icons.insert_drive_file,color: Colors.white,), color: Colors.indigo),
              menuIcon(text: "Camera", icon: Icon(Icons.camera_alt,color: Colors.white,), color: Colors.pink),
              menuIcon(text: "Gallery", icon: Icon(Icons.insert_photo,color: Colors.white,), color: Colors.purple)
              // Icon(Icons.insert_drive_file),
              // Icon(Icons.insert_drive_file),
              // Icon(Icons.insert_drive_file),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              menuIcon(text: "Audio", icon: Icon(Icons.headphones,color: Colors.white,), color: Colors.orange),
              menuIcon(text: "Location", icon: Icon(Icons.location_pin,color: Colors.white,), color: Colors.green),
              menuIcon(text: "Payment", icon: Icon(Icons.currency_rupee_rounded,color: Colors.white,), color: Colors.teal)
              // Icon(Icons.insert_drive_file),
              // Icon(Icons.insert_drive_file),
              // Icon(Icons.insert_drive_file),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            menuIcon(text: "Contact", icon: Icon(Icons.person,color: Colors.white,), color: Colors.blue),
            menuIcon(text: "Poll", icon: Icon(Icons.bar_chart,color: Colors.white,), color: Colors.teal),
            UtilityWidget().widthSpacer(52),
              // Icon(Icons.insert_drive_file),
              // Icon(Icons.insert_drive_file),
              // Icon(Icons.insert_drive_file),
            ],
          ),
        ],
      ),

      
    );
  }
  Column menuIcon({required String text,required Icon icon,required Color color}){
    return Column(
      children: [
        CircleAvatar(radius: 30,backgroundColor: color,child: icon,),
        Text(text),
      ],
    );
  }
}
