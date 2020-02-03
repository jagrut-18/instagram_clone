import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class Comments extends StatefulWidget {
  final List comments;
  Comments(this.comments);
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {

  List<bool> _like = [];
  List<int> _time = [];
  List<int> _likes = [];
  Random _random = Random();
  int next(int min, int max) {
    return min + _random.nextInt(max - min);
  }

  @override
  void initState() { 
    super.initState();
    for(int i=0;i<widget.comments.length;i++){
      _like.add(false);
      _time.add(next(5,55));
      _likes.add(next(1,200));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView.builder(
        itemCount: widget.comments.length,
        itemBuilder: (context, index){
            return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            child: CircleAvatar(
                              radius: 15,
                              child: Text('A'),
                            ),
                            onTap: () {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text('Account Name', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(widget.comments[index])
                      ],
                    ),
                    Container(
                      width: 200,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(child: Text(_time[index].toString() + 'm', style: TextStyle(color: Colors.grey),)),
                            Expanded(child: Text(_likes[index].toString() + ' likes', style: TextStyle(color: Colors.grey),)),
                            Expanded(child: Text('Replay', style: TextStyle(color: Colors.grey),))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                IconButton(
                  iconSize: 15,
                  icon: _like[index]==true?Icon(FontAwesomeIcons.solidHeart, color: Colors.red):Icon(FontAwesomeIcons.heart),
                  onPressed: (){
                    setState(() {
                     _like[index] = !_like[index]; 
                    });
                  },
                )
              ],
            );
        },
      ),
          ),
    );
  }
}