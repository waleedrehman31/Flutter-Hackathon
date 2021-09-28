import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final primaryColor = Color(0xFF6200EE);
  final secondaryColor = Colors.white;
  @override
  Widget build(BuildContext context) {
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
                  "News Homepage",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: secondaryColor,
                  ),
                ),
              ),
            ),
            myCard(
              "Waleed ur Rehman",
              "https://cdn.pixabay.com/photo/2018/03/21/16/50/woman-3247382__340.jpg",
            ),
            myCard(
              "Waleed ur Rehman",
              "https://cdn.pixabay.com/photo/2018/03/21/16/50/woman-3247382__340.jpg",
            ),
            myCard(
              "Waleed ur Rehman",
              "https://cdn.pixabay.com/photo/2018/03/21/16/50/woman-3247382__340.jpg",
            ),
            myCard(
              "Waleed ur Rehman",
              "https://cdn.pixabay.com/photo/2018/03/21/16/50/woman-3247382__340.jpg",
            ),
            myCard(
              "Waleed ur Rehman",
              "https://cdn.pixabay.com/photo/2018/03/21/16/50/woman-3247382__340.jpg",
            ),
            myCard(
              "Waleed ur Rehman",
              "https://cdn.pixabay.com/photo/2018/03/21/16/50/woman-3247382__340.jpg",
            ),
          ],
        ),
      ),
    );
  }
}

Widget myCard(name, image) {
  return GestureDetector(
    onTap: () {
      print("You Tap On Card");
    },
    child: Card(
      elevation: 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Image(
            image: NetworkImage(image),
          ),
          Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                IconButton(icon: Icon(Icons.favorite_border), onPressed: () {})
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            child: Text("Description Goes Here"),
          ),
          Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            child: ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Read More'),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
              onPressed: () {
                print('Button Pressed from card');
              },
            ),
          ),
        ],
      ),
    ),
  );
}
