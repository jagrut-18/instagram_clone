import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/account.dart';
import 'package:instagram_clone/chat_screen.dart';
import 'package:instagram_clone/post.dart';
import 'package:instagram_clone/post_widget.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:instagram_clone/story.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  List<Widget> _stories = [
    Story(),
    Story(),
    Story(),
    Story(),
    Story(),
    Story(),
    Story(),
    Story(),
    Story(),
  ];
  int _selectedScreen = 0;
  int _tab = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            _selectedScreen == 0 ? Size.fromHeight(50) : Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          leading: GestureDetector(
            child: Icon(FontAwesomeIcons.camera, color: Colors.black),
            onTap: getImage,
          ),
          title: Text('Instagram', style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            GestureDetector(
              child: Image.asset(
                'assets/igtv.png',
                height: 25,
                width: 25,
              ),
              onTap: () {},
            ),
            Padding(
              padding: EdgeInsets.only(right: 10, left: 20),
              child: GestureDetector(
                child: Icon(FontAwesomeIcons.paperPlane, color: Colors.black),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChatScreen()));
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Icon(
                  _selectedScreen == 0 ? Icons.home : OMIcons.home,
                  size: 35,
                ),
              ),
              onTap: () {
                setState(() {
                  _selectedScreen = 0;
                });
              },
            ),
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: _selectedScreen == 1
                    ? Image.asset(
                        'assets/search.png',
                        height: 25,
                        width: 25,
                      )
                    : Icon(
                        Icons.search,
                        size: 30,
                      ),
              ),
              onTap: () {
                setState(() {
                  _selectedScreen = 1;
                });
              },
            ),
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Icon(
                  _selectedScreen == 2 ? Icons.add_box : OMIcons.addBox,
                  size: 30,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PostScreen()));
                // setState(() {
                //   _selectedScreen = 2;
                // });
              },
            ),
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Icon(
                  _selectedScreen == 3
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  size: 25,
                ),
              ),
              onTap: () {
                setState(() {
                  _selectedScreen = 3;
                });
              },
            ),
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Icon(
                  _selectedScreen == 4
                      ? FontAwesomeIcons.userAlt
                      : FontAwesomeIcons.user,
                  size: 25,
                ),
              ),
              onTap: () {
                setState(() {
                  _selectedScreen = 4;
                });
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: home(),
      ),
    );
  }

  Widget home() {
    Widget w;
    setState(() {
      if (_selectedScreen == 0) {
        w = ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Container(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _stories,
                ),
              ),
            ),
            Divider(),
            PostWidget(),
            PostWidget(),
            PostWidget(),
            PostWidget(),
            PostWidget(),
            PostWidget(),
            PostWidget(),
          ],
        );
      } else if (_selectedScreen == 1) {
        w = Container(
          child: Text(
            'Explore Section',
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
        );
      }
      // else if (_selectedScreen == 2) {

      //   w = Container(
      //     child: Text('Post a photo', style: TextStyle(fontSize: 20, color: Colors.black54),),
      //   );
      // }
      else if (_selectedScreen == 3) {
        w = Column(
          children: <Widget>[
            TabBar(
              onTap: (index) {
                setState(() {
                  _tab = index;
                });
              },
              controller: _tabController,
              tabs: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 3, bottom: 10),
                  child: Text(
                    'Following',
                    style: TextStyle(
                        color: _tab == 0 ? Colors.black : Colors.black54,
                        fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3, bottom: 10),
                  child: Text(
                    'You',
                    style: TextStyle(
                        color: _tab == 1 ? Colors.black : Colors.black54,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: _tab == 0
                  ? Container(
                      child: Text('Followers\' Acitivity ',
                          style:
                              TextStyle(fontSize: 20, color: Colors.black54)))
                  : Container(
                      child: Text('Your Activity',
                          style:
                              TextStyle(fontSize: 20, color: Colors.black54)),
                    ),
            )
          ],
        );
      } else if (_selectedScreen == 4) {
        w = Account();
      }
    });
    return w;
  }
}
