import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/chatpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
with SingleTickerProviderStateMixin
 {
  late TabController _controller;

 
   @override
  void initState() {
    super.initState();
    _controller=TabController(length: 4, vsync: this,initialIndex: 1);
    
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Whatsapp"),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(onPressed: () {}, 
          icon: Icon(Icons.camera_alt)),
          IconButton(onPressed: () {}, 
          icon: Icon(Icons.search)), 

           PopupMenuButton(onSelected: (value) {
            print(value);
           },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value :1 ,child: Text("New Group")),
                PopupMenuItem(value :2 ,child: Text("New Brodcast")),
                PopupMenuItem(value :3 ,child: Text("Linked Devices")),
                PopupMenuItem(value :4 ,child: Text("Starred Messeges")),
                  PopupMenuItem(value :5 ,child: Text("Settings"))

              ];
              
            })
        ],

        bottom: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "chats" ,
            ),
            Tab(
              text: "status",
            ),
            Tab(
              text: "calls",
            ),
          ],
          controller: _controller,


          ),


        ) ,
        body: TabBarView(
          controller: _controller,
          children: [
            Text("camera"),
            ChatPage(),
            Text("status"),
            Text("calls"),
          ],

        ),
        
    );
  }
}