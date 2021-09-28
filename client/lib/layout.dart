import 'package:client/screens/Home.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({Key key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6200EE),
        title: Text("News App"),
        actions: <Widget>[
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2018/03/21/16/50/woman-3247382__340.jpg'),
          ),
          IconButton(
            icon: const Icon(Icons.sync_outlined),
            tooltip: 'Refresh',
            onPressed: () {},
          ),
        ],
      ),
      drawer: myDrawer(context),
      body: Center(
        child: Home(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF6200EE),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
        },
        items: [
          BottomNavigationBarItem(
            title: Text('News'),
            icon: Icon(Icons.library_books),
          ),
          BottomNavigationBarItem(
            title: Text('Favorites'),
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            title: Text('Search'),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text('Profile'),
            icon: Icon(Icons.account_box_rounded),
          ),
        ],
      ),
    );
  }
}

Widget myDrawer(context) {
  bool isUser = true;
  if (isUser) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Container(
              height: 142,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                  "https://cdn.pixabay.com/photo/2018/03/21/16/50/woman-3247382__340.jpg"),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              title: Text("Full Name"),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              title: Text("Username"),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              title: Text("Email"),
            ),
          ),
          SizedBox(
            height: 275,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF6200EE),
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.only(left: 15, right: 15),
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                title: Center(
                  child: Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: (20),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 35,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Center(
                child: Text(
                  'News App v1.0.0',
                  style: TextStyle(
                    color: const Color(0xffffffff),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  } else {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          DrawerHeader(
            child: Text(
              "You Are not Login. Please login first",
              style: TextStyle(
                fontSize: (20),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF6200EE),
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.only(left: 15, right: 15),
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                title: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: (20),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF6200EE),
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.only(left: 15, right: 15),
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                title: Center(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: (20),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 35,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Center(
                child: Text(
                  'News App v1.0.0',
                  style: TextStyle(
                    color: const Color(0xffffffff),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}