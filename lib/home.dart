import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        ) ,
        
    );
  }
}