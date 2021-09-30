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
        //let's check if we got a response or not
        if (snapshot.hasData) {
          //Now let's make a list of articles
          List<Article> articles = snapshot.data;
          return ListView.builder(
            //Now let's create our custom List tile
            itemCount: articles.length,
            itemBuilder: (context, index) =>
                customListTile(articles[index], context),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
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
