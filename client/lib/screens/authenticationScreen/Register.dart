import 'package:flutter/material.dart';
import 'package:client/constant/constant.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final String errorType = '';
    final TextEditingController nameController = TextEditingController();
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    onSubmit() {
      final String fullName = nameController.text;
      final String userName = userNameController.text;
      final String email = emailController.text;
      final String password = passwordController.text;
      print("Full Name: " + nameController.text);
      print("UserName: " + userNameController.text);
      print("Email: " + emailController.text);
      print("Password: " + passwordController.text);
    }

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
                  "User Register",
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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Full Name',
                        icon: const Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: const Icon(
                            Icons.person,
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
                    TextFormField(
                      controller: userNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username Name',
                        icon: const Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: const Icon(
                            Icons.perm_contact_calendar,
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
                    TextFormField(
                      autocorrect: false,
                      textCapitalization: TextCapitalization.none,
                      enableSuggestions: false,
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email address.';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
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
                        key: ValueKey('password'),
                        validator: (value) {
                          if (value.isEmpty || value.length < 7) {
                            return 'Password must be at least 7 characters long.';
                          }
                          return null;
                        },
                        obscureText: _passwordVisible ? false : true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide:
                                BorderSide(color: primaryColor, width: 2),
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
                      );
                    }),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                        onSubmit();
                      },
                      child: Text(
                        "Register",
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
            ),
          ],
        ),
      ),
    );
  }
}
