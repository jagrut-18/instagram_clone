import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/comments.dart';

class PostWidget extends StatefulWidget {
  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool _like = false;
  bool _bookMark = false;
  bool _heart = false;
  String _comment;
  List _comments = [];
  TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text('Account Name',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                GestureDetector(
                  child: Icon(Icons.more_vert),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: Center(
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/water.jpg'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: _heart == true
                          ? Icon(FontAwesomeIcons.solidHeart,
                              size: 70, color: Colors.white)
                          : Container(),
                    )
                  ],
                ),
              ),
              onDoubleTap: () {
                setState(() {
                  _like = true;
                  _heart = true;
                  Future.delayed(Duration(seconds: 1), () {
                    setState(() {
                      _heart = false;
                    });
                  });
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GestureDetector(
                      child: _like == false
                          ? Icon(FontAwesomeIcons.heart)
                          : Icon(FontAwesomeIcons.solidHeart,
                              color: Colors.red),
                      onTap: () {
                        setState(() {
                          _like = !_like;
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                        child: Icon(FontAwesomeIcons.comment),
                        onTap: () {},
                      ),
                    ),
                    GestureDetector(
                      child: Icon(FontAwesomeIcons.paperPlane),
                      onTap: () {},
                    ),
                  ],
                ),
                GestureDetector(
                  child: Icon(_bookMark == false
                      ? FontAwesomeIcons.bookmark
                      : FontAwesomeIcons.solidBookmark),
                  onTap: () {
                    setState(() {
                      _bookMark = !_bookMark;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text('Account Name',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Text('Caption'),
                  ],
                ),
                GestureDetector(
                  child: Text('View all comments'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Comments(_comments)));
                  },
                ),
                _comments.length != 0 ? Text(_comments.last) : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        child: CircleAvatar(
                          radius: 10,
                          child: Text('A'),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _commentController,
                        decoration: InputDecoration(
                          hintText: 'Add a comment',
                          border: InputBorder.none,
                        ),
                        onChanged: (comment) {
                          setState(() {
                            _comment = comment;
                          });
                        },
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        'Post',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        setState(() {
                          if (_commentController.text.isNotEmpty) {
                            _commentController.clear();
                            _comments.add(_comment);
                          }
                        });
                      },
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
