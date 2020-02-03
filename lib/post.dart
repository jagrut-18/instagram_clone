import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'POST',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBar: TabBar(
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.black,
          indicatorColor: Colors.black,
          tabs: <Widget>[
            Tab(text: 'GALLERY'),
            Tab(text: 'PHOTO'),
            Tab(text: 'VIDEO')
          ],
        ),
        body: TabBarView(
          children: [
            ListView(
              children: <Widget>[
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/water.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                GridView.count(
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  children: List.generate(50, (index) {
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/water.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  height: 300,
                  color: Colors.black,
                ),
                Expanded(
                  child: Container(
                      child: Center(
                    child: CircleAvatar(
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                      ),
                      radius: 40,
                      backgroundColor: Colors.grey[300],
                    ),
                  )),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  height: 300,
                  color: Colors.black,
                ),
                Expanded(
                  child: Container(
                      child: Center(
                    child: CircleAvatar(
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                      ),
                      radius: 40,
                      backgroundColor: Colors.grey[300],
                    ),
                  )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
