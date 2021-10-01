import 'package:client/screens/authenticationScreen/Login.dart';
import 'package:client/screens/authenticationScreen/Register.dart';
import 'package:flutter/material.dart';
import 'package:client/model/news_model.dart';
import 'package:client/constant/constant.dart';

class ArticleDetail extends StatelessWidget {
  final Article article;
  bool isUser = false;

  ArticleDetail({this.article});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("News App"),
        actions: <Widget>[
          TextButton(
            child: Text(
              "Login",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor),
            ),
            onPressed: () => {},
          ),
          TextButton(
            child: Text(
              "Register",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: secondaryColor,
              ),
            ),
            onPressed: () => {},
          ),
          // CircleAvatar(
          //   radius: 25,
          //   backgroundImage: NetworkImage(
          //       'https://cdn.pixabay.com/photo/2018/03/21/16/50/woman-3247382__340.jpg'),
          // ),
          // TextButton(
          //   child: Text(
          //     "Logout",
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       color: secondaryColor,
          //     ),
          //   ),
          //   onPressed: () => {
          //     setState(
          //       () {
          //         currentScreen = Login();
          //       },
          //     )
          //   },
          // ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(5.0),
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                //let's add the height

                image: DecorationImage(
                    image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 6.0, bottom: 6.0, left: 8.0, right: 8.0),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                article.source.name,
                style: TextStyle(
                  color: secondaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              article.description,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              article.content,
              style: TextStyle(
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
