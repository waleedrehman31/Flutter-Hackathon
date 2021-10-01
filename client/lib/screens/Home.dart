import 'package:client/services/news_serviceApi.dart';
import 'package:flutter/material.dart';
import 'package:client/constant/constant.dart';
import 'package:client/model/news_model.dart';
import 'package:client/components/customListTile.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiService client = ApiService();
  Widget allnews() {
    return FutureBuilder(
      future: client.getArticle(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          List<Article> articles = snapshot.data;
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) =>
                customListTile(articles[index], context),
          );
        } else if (snapshot.hasError) {
          if (snapshot.error.runtimeType.toString() == "SocketException") {
            return AlertDialog(
              title: new Text(
                "Network Error",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: new Text(
                "Kindly Check Your Internet! ${snapshot.error.runtimeType.toString()} : ${snapshot.error.hashCode}",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              actions: <Widget>[
                new ElevatedButton(
                  child: new Text("Close"),
                  style: ElevatedButton.styleFrom(primary: primaryColor),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }
          return Text('${snapshot.error.runtimeType.toString()}');
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                "News Homepage",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: allnews(),
          ),
        ],
      ),
    );
  }
}
