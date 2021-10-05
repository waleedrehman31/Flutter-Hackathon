import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:client/constant/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;
    print(auth.currentUser.metadata);
    String userUid = auth.currentUser.uid;
    String userEmail = auth.currentUser.email;
    Stream documentStream =
        FirebaseFirestore.instance.collection('user').doc(userUid).snapshots();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                  "User Detail",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: secondaryColor,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image(
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2018/03/21/16/50/woman-3247382__340.jpg"),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: documentStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                return ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    return ListTile(
                      title: Text(data['full_name']),
                      subtitle: Text(data['company']),
                    );
                  }).toList(),
                );
              },
            ),
            myContainer(context, "ID: ", userUid),
            myContainer(context, "Full Name: ", "Waleed ur Rehman"),
            myContainer(context, "Username: ", "waleedrehman31"),
            myContainer(context, "Email: ", "waleedrehman31@gmail.com"),
            myContainer(context, "Joined Date: ", "28, 8, 2021"),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(primary: primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget myContainer(context, title, description) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          description,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}
