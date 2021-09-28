import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        primary: true,
        padding: const EdgeInsets.all(1.0),
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        children: <Widget>[
          myCard("Facebook",
              "https://cdn.pixabay.com/photo/2018/03/21/16/50/woman-3247382__340.jpg"),
          myCard("Twitter",
              "https://cdn.pixabay.com/photo/2018/03/21/16/50/woman-3247382__340.jpg"),
          myCard("Instagram",
              "https://cdn.pixabay.com/photo/2018/03/21/16/50/woman-3247382__340.jpg"),
          myCard("Linkedin",
              "https://cdn.pixabay.com/photo/2018/03/21/16/50/woman-3247382__340.jpg"),
          myCard("Google Plus",
              "https://cdn.pixabay.com/photo/2018/03/21/16/50/woman-3247382__340.jpg"),
          myCard("Launcher Icon",
              "https://cdn.pixabay.com/photo/2018/03/21/16/50/woman-3247382__340.jpg"),
        ],
      ),
      // Card(
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: <Widget>[
      //       const ListTile(
      //         leading: Icon(Icons.album),
      //         title: Text('The Enchanted Nightingale'),
      //         subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
      //       ),
    );
  }
}

Widget myCard(name, image) {
  return GestureDetector(
    onTap: () {
      print("onTap called.");
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
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(name),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
              child: const Text('LISTEN'),
              onPressed: () {
                print('Button Pressed from card');
              }),
        ],
      ),
    ),
  );
}
