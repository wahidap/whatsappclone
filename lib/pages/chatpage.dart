import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chatmodel.dart';
import 'package:whatsapp_clone/pages/chattile.dart';

class ChatPage extends StatelessWidget {
   ChatPage({super.key});
  List<Chat> chatList = [
    Chat(
        avatar:
           "",
        name: "adhologam",
        isGroup: true,
        updatedAt: "9:00 am",
        message: "good  morning",
        status: "group description is here"),
       
        Chat(
        avatar:"https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8&w=1000&q=80",
        name: "ravi",
        isGroup: false,
        updatedAt: "12:00 am",
        message: "hey",
        status: "online"),
        

         Chat(
        avatar:
           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBtqIIUres0BxnahQb9vm3Kdqa0pr53QhvKg&usqp=CAU",
        name: "friends",
        isGroup: true,
        updatedAt: "9:00 am",
        message: "good night",
        status: "group description is here"),

        Chat(
        avatar:"",
        name: "asim",
        isGroup: false,
        updatedAt: "12:00 am",
        message: "where",
        status:"offline" ),
        
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
        return ChatTile(
          chatdata: chatList[index],
            );
      }),
   
   floatingActionButton: FloatingActionButton(onPressed: () {
     
   },
   backgroundColor: Colors.teal,
   child: Icon(Icons.chat),
   ),
    );
  }
}
