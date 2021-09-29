import 'package:flutter/material.dart';
import 'package:client/constant/constant.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                // prefixIcon: Icon(
                //   Icons.email,
                //   color: primaryColor,
                // ),
                icon: const Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: const Icon(
                    Icons.email,
                    color: primaryColor,
                  ),
                ),
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white70,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: primaryColor, width: 2),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            StatefulBuilder(builder: (_context, _setState) {
              // only following widget gets update when _setState is used
              return TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: primaryColor, width: 2),
                  ),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: primaryColor,
                    ),
                    onPressed: () {
                      // use _setState that belong to StatefulBuilder
                      _setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  labelText: 'Password',
                  icon: const Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: const Icon(
                      Icons.lock,
                      color: primaryColor,
                    ),
                  ),
                ),
                validator: (val) =>
                    val.length < 6 ? 'Password too short.' : null,
                obscureText: true,
              );
            }),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => {},
              child: Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(primary: primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
