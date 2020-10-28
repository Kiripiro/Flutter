import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login.dart';
import 'auth.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FirebaseUser user;
  String name, em, pw;

  void clickEventEmailSignUp() {
    signUpWithEmail(em, pw, name).then((user) => {
          this.user = user,
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()))
        });
  }

  Widget loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget emailPasswordSignUp() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: <Widget>[
              Text(
                'SIGN UP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              new Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                  onChanged: (textVal) {
                    setState(() {
                      name = textVal;
                    });
                  },
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      size: 35.0,
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                    )),
                    hintText: 'Username',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    focusColor: Colors.white,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              new Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                  onChanged: (textVal) {
                    setState(() {
                      em = textVal;
                    });
                  },
                  decoration: InputDecoration(
                    icon: Icon(
                      FontAwesomeIcons.solidEnvelope,
                      size: 35,
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                    )),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    focusColor: Colors.white,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              new Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: TextFormField(
                  onChanged: (textVal) {
                    setState(() {
                      pw = textVal;
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      size: 35.0,
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                    )),
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                    focusColor: Colors.white,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                ),
              ),
              InkWell(
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: RaisedButton(
                        onPressed: this.clickEventEmailSignUp,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45)),
                        splashColor: Colors.white,
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(FontAwesomeIcons.solidEnvelope, size: 35),
                                Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text('| Sign up',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)))
                              ],
                            )),
                      ))),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/background_login.gif"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            emailPasswordSignUp(),
            loginAccountLabel(),
          ]),
        )
      ],
    ));
  }
}
