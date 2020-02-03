import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Widget> chats = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; i++) {
      chats.add(ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/avatar.jpg'),
          radius: 25,
        ),
        trailing: Icon(Icons.camera_alt),
        title: Text('Username'),
        subtitle: Text('message · 10m'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Direct',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          Icon(
            Icons.video_call,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.edit,
            color: Colors.black,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Messages',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ] +
              chats,
        ),
      ),
    );
  }
}
