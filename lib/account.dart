import 'dart:math';

import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> with TickerProviderStateMixin {
  int _tab = 0;
  TabController _tabController;
  Random _random = Random();
  int next(int min, int max) {
    return min + _random.nextInt(max - min);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Account Name',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: Color(0xff7c94b6),
                    image: DecorationImage(
                      image: AssetImage('assets/avatar.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text('13',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Posts')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(next(300, 1000).toString(),
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Followers')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(next(300, 1000).toString(),
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Following')
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text('Full Name',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text('Description',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey[350], width: 1),
                  borderRadius: BorderRadius.circular(5)),
              child: Text('Edit Profile',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onPressed: () {},
            ),
          ),
          Divider(),
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
                child: Icon(
                  Icons.grid_on,
                  color: _tab == 0 ? Colors.black : Colors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3, bottom: 10),
                child: Icon(Icons.supervised_user_circle,
                    color: _tab == 1 ? Colors.black : Colors.grey),
              ),
            ],
          ),
          _tab == 0
              ? GridView(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2),
                  children: <Widget>[
                    Image.asset('assets/account.png'),
                    Image.asset('assets/account.png'),
                    Image.asset('assets/account.png'),
                    Image.asset('assets/account.png'),
                    Image.asset('assets/account.png'),
                    Image.asset('assets/account.png'),
                    Image.asset('assets/account.png'),
                    Image.asset('assets/account.png'),
                    Image.asset('assets/account.png'),
                    Image.asset('assets/account.png'),
                    Image.asset('assets/account.png'),
                    Image.asset('assets/account.png'),
                    Image.asset('assets/account.png'),
                    Image.asset('assets/account.png'),
                  ],
                )
              : Container(
                  child: Center(
                      child: Text(
                    'Tagged Posts',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  )),
                )
        ],
      ),
    );
  }
}
