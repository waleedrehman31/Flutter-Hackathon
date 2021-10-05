import 'package:flutter/material.dart';
import 'package:client/constant/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((User user) {
      if (user == null) {
        return Scaffold(
          body: Text("You are Not Logged in"),
        );
      } else {
        print(user.email);
      }
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    "Favourite News",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor,
                    ),
                  ),
                ),
              ),
              myNewsCard(),
              myNewsCard(),
              myNewsCard(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget myNewsCard() {
  return Card(
    child: ListTile(
        leading: Image.network(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxeBt1LGBMpP_zw_il4wf6kSVYlIE3xN40AA&usqp=CAU",
          height: 250,
        ),
        title: Text(
          'Iphone 12',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Category",
                ),
              ],
            ),
            Text(
              "Description of news goes here ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            size: 30,
            color: Colors.redAccent,
          ),
          onPressed: () => {
            print('delete button Pressd'),
          },
        )),
  );
}
