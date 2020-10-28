import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final FacebookLogin facebookLogIn = FacebookLogin();

//GOOGLE

Future<FirebaseUser> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(currentUser.uid == user.uid);

  return user;
}

//FACEBOOK

Future<FirebaseUser> signInWithFacebook() async {
  final result = await facebookLogIn.logIn(['email']);
  final token = result.accessToken.token;
  final graphResponse = await http.get(
      'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token');
  print(graphResponse.body);

  final credential = FacebookAuthProvider.getCredential(accessToken: token);

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(currentUser.uid == user.uid);

  return user;
}

// EMAIL

Future<FirebaseUser> signUpWithEmail(
    String email, String password, String name) async {
  final AuthResult authResult = await _auth.createUserWithEmailAndPassword(
      email: email, password: password);
  final FirebaseUser user = authResult.user;
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(currentUser.uid == user.uid);

  //Update Username
  UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
  userUpdateInfo.displayName = name;
  user.updateProfile(userUpdateInfo);

  return user;
}

Future<FirebaseUser> signInWithEmail(String em, String pw) async {
  final AuthResult authResult =
      await _auth.signInWithEmailAndPassword(email: em, password: pw);
  final FirebaseUser user = authResult.user;
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(currentUser.uid == user.uid);
  print(user.displayName);
  return user;
}
