import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'myHomePage.dart';
import 'auth.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sign_up_email.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body());
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FirebaseUser user;
  String em, pw;

  @override
  void initState() {
    super.initState();
    signOutGoogle();
    signOutFacebook();
  }

  void clickEventGoogleSignIn() {
    signInWithGoogle().then((user) => {
          this.user = user,
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyHomePage(user)))
        });
  }

  void clickEventFacebookSignIn() {
    signInWithFacebook().then((user) => {
          this.user = user,
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyHomePage(user)))
        });
  }

  void clickEventEmailSignIn() {
    signInWithEmail(em, pw).then((user) => {
          this.user = user,
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyHomePage(user)))
        });
  }

  Widget googleLoginButton() {
    return new Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: IconButton(
        onPressed: this.clickEventGoogleSignIn,
        icon: Image(image: AssetImage('assets/google_logo.png'), height: 35),
      ),
    );
  }

  Widget facebookLoginButton() {
    return new Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: IconButton(
        onPressed: this.clickEventFacebookSignIn,
        icon: Image(image: AssetImage('assets/facebook_logo.png'), height: 45),
      ),
    );
  }

  Widget emailPasswordSignIn() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: <Widget>[
              Text(
                'LOG IN',
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
                      em = textVal;
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
              new Container(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                      child: FlatButton(
                        onPressed: () {
                          print("oui");
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             SignUpPage())); //LINK REMEMBER ME
                        },
                        color: Color.fromRGBO(255, 255, 255, 0),
                        child: Text(
                          'REMEMBER ME',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                      child: FlatButton(
                        onPressed: () {
                          print("non"); //LINK PAGE RESET PASSWORD
                        },
                        color: Color.fromRGBO(255, 255, 255, 0),
                        child: Text(
                          'FORGOT PASSWORD?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: FlatButton(
                        onPressed: this.clickEventEmailSignIn,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        splashColor: Colors.white,
                        color: Colors.transparent,
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Login',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white))
                              ],
                            )),
                      ))),
            ],
          ),
        )
      ],
    );
  }

  // Widget upperText() {
  //   return SafeArea(
  //       child: Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 40.0),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: Colors.white.withOpacity(0.25),
  //         borderRadius: BorderRadius.circular(45.0),
  //       ),
  // child: Padding(
  //   padding: const EdgeInsets.all(8.0),
  //   child: Column(
  //     children: <Widget>[
  //       Icon(
  //         FontAwesomeIcons.key,
  //         color: Colors.deepOrangeAccent,
  //         size: 50.0,
  //       ),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Text(
  //             'Lé',
  //             style: TextStyle(
  //               fontSize: 38.0,
  //               fontWeight: FontWeight.bold,
  //               color: Color.fromRGBO(240, 156, 81, 1),
  //             ),
  //           ),
  //           Text(
  //             'on',
  //             style: TextStyle(
  //               fontSize: 38.0,
  //               fontWeight: FontWeight.bold,
  //               color: Colors.white,
  //             ),
  //           ),
  //         ],
  //       ),
  //       Text(
  //         'blablabla',
  //         style: TextStyle(
  //           color: Colors.white,
  //           fontSize: 18.0,
  //         ),
  //         textAlign: TextAlign.center,
  //       ),
  //     ],
  //   ),
  // ),
  //     ),
  //   ));
  // }

  Widget signUpAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Sign up.',
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
        // Align(
        //     alignment: Alignment.topCenter,
        //     child: SafeArea(child: upperText())),
        Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            emailPasswordSignIn(),
            Row(children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 35.0, right: 10.0),
                  child: Divider(color: Colors.white),
                ),
              ),
              Text(
                'OR',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 35.0),
                      child: Divider(color: Colors.white))),
            ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [googleLoginButton(), facebookLoginButton()]),
            signUpAccountLabel()
          ]),
        )
      ],
    ));
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
  }

  void signOutFacebook() async {
    await facebookLogIn.logOut();
  }
}
