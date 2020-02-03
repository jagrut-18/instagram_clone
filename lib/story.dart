import 'package:flutter/material.dart';

class Story extends StatefulWidget {
  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: <Widget>[
          Container(
                   width: 70.0,
                   height: 70.0,
                   decoration: BoxDecoration(
                     color: Color(0xff7c94b6),
                     image: DecorationImage(
                       image: AssetImage('assets/avatar.jpg'),
                       fit: BoxFit.cover,
                     ),
                     borderRadius: BorderRadius.all(Radius.circular(50.0)),
                     border: Border.all(
                       color: Color(0xffC5008E),
                       width: 3.0,
                     ),
                   ),
                 ),
                 Padding(
                   padding: EdgeInsets.only(top: 3),
                   child: Text('Account'),
                 )
        ],
      ),
    );
  }
}