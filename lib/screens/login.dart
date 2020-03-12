import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Content(),
    );
  }
}

class Content extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    return user;
  }

  void _signOut(context) async {
    print('sign out');
    await _googleSignIn.signOut();
    // Scaffold.of(context).showSnackBar(
    //   SnackBar(
    //     content: Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text(
    //           'Signed Out',
    //           style: TextStyle(
    //             fontSize: 16,
    //             fontWeight: FontWeight.w500,
    //           ),
    //         ),
    //       ],
    //     ),
    //     duration: Duration(seconds: 3),
    //     backgroundColor: Colors.lightGreen,
    //   ),
    // );
    showDialog(
      context: context,
      child: AlertDialog(
        title: Text('Title...'),
        content: Text('Alert...'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => {},
          ),
        ],
      ),
    );
  }

  Widget _signInButton(BuildContext context) {
    return RaisedButton(
      onPressed: () => _signIn()
          .whenComplete(
              () => Navigator.pushReplacementNamed(context, '/BatmanShows'))
          .catchError((error) => print(error)),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/google_logo.png',
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signOutButton(BuildContext context) {
    return RaisedButton(
      onPressed: () => _signOut(context),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 9, 0, 9),
        child: Text(
          'Sign Out',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      color: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _signInButton(context),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          _signOutButton(context),
        ],
      ),
    );
  }
}
