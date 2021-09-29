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
                  "User Login",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: secondaryColor,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
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
          ],
        ),
      ),
    );
  }
}
