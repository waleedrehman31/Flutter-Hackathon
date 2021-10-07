import 'package:client/screens/Favourite.dart';
import 'package:client/screens/Home.dart';
import 'package:client/screens/Profile.dart';
import 'package:client/screens/Search.dart';
import 'package:client/screens/authenticationScreen/Login.dart';
import 'package:client/screens/authenticationScreen/Register.dart';
import 'package:flutter/material.dart';
import 'package:client/constant/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Layout extends StatefulWidget {
  const Layout({Key key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentTab = 0;
  Widget currentScreen = Home();
  bool isUser = false;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((User user) {
      if (user == null) {
        print("User Not Logged In");
        setState(() {
          isUser = false;
        });
      } else {
        setState(() {
          isUser = true;
        });
      }
    });
    return Scaffold(
      appBar: myAppbar(context, currentScreen, currentTab, setState, isUser),
      drawer: myDrawer(context, currentScreen, setState, isUser),
      body: Center(
        child: PageStorage(bucket: PageStorageBucket(), child: currentScreen),
      ),
      bottomNavigationBar: BottomAppBar(
        // notchMargin: 50,
        color: primaryColor,

        child: Container(
          height: 60,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                  minWidth: 50,
                  onPressed: () => {
                    setState(
                      () {
                        currentScreen = Home();
                        currentTab = 1;
                      },
                    )
                  },
                  child: Icon(
                    Icons.home,
                    color: currentTab == 1 ? secondaryColor : Colors.white70,
                  ),
                ),
                MaterialButton(
                  minWidth: 60,
                  onPressed: () => {
                    setState(() {
                      currentScreen = Favourite();
                      currentTab = 2;
                    })
                  },
                  child: Icon(
                    Icons.favorite_outline,
                    color: currentTab == 2 ? secondaryColor : Colors.white70,
                  ),
                ),
                MaterialButton(
                  minWidth: 60,
                  onPressed: () => {
                    setState(() {
                      currentScreen = Search();
                      currentTab = 3;
                    })
                  },
                  child: Icon(
                    Icons.search,
                    color: currentTab == 3 ? secondaryColor : Colors.white70,
                  ),
                ),
                MaterialButton(
                  minWidth: 60,
                  onPressed: () => {
                    setState(
                      () {
                        currentScreen = Profile();
                        currentTab = 4;
                      },
                    )
                  },
                  child: Icon(
                    Icons.person,
                    color: currentTab == 4 ? secondaryColor : Colors.white70,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

Widget myAppbar(context, currentScreen, currentTab, setState, isUser) {
  if (isUser) {
    return AppBar(
      backgroundColor: primaryColor,
      title: Text("News App"),
      actions: <Widget>[
        CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
              'https://cdn.pixabay.com/photo/2018/03/21/16/50/woman-3247382__340.jpg'),
        ),
        TextButton(
          child: Text(
            "Logout",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: secondaryColor,
            ),
          ),
          onPressed: () => {
            setState(
              () {
                currentScreen = Login();
              },
              FirebaseAuth.instance.signOut(),
            )
          },
        ),
      ],
    );
  } else {
    return AppBar(
      backgroundColor: primaryColor,
      title: Text("News App"),
      actions: <Widget>[
        TextButton(
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: currentTab == 5 ? secondaryColor : Colors.white70,
            ),
          ),
          onPressed: () => {
            setState(
              () {
                currentScreen = Login();
                currentTab = 5;
              },
            )
          },
        ),
        TextButton(
          child: Text(
            "Register",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: currentTab == 6 ? secondaryColor : Colors.white70,
            ),
          ),
          onPressed: () => {
            setState(
              () {
                currentScreen = Register();
                currentTab = 6;
              },
            )
          },
        ),
      ],
    );
  }
}

Widget myDrawer(context, currentScreen, setState, isUser) {
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
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
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
                      color: secondaryColor,
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
            onTap: () {
              setState(() {
                currentScreen = Login();
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
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
                color: primaryColor,
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
