import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  UserCredential? userCredential;

  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    if (userCredential == null) {
      return buildNotLoginScreen();
    } else {
      return buildLoginScreen();
    }
  }

  Container buildNotLoginScreen() {
    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.red,
                ),
                // borderRadius: BorderRadius.all(
                //   Radius.circular(20),
                // ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '현재 로그인 되어있지 않습니다.',
                  style: TextStyle(fontFamily: 'Noto_Sans_KR', fontSize: 20),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            SignInButton(
              Buttons.Email,
              text: '이메일로 로그인',
              onPressed: () {
                signInWithGoogle();
              },
            ),
            SignInButton(
              Buttons.Google,
              text: '구글 계정으로 로그인',
              onPressed: () {
                signInWithGoogle();
              },
            ),
            SignInButton(
              Buttons.Facebook,
              text: '페이스북 계정으로 로그인',
              onPressed: () {
                signInWithGoogle();
              },
            ),
            RaisedButton(
              onPressed: () {
                print(userCredential!.user);
                print(userCredential!.additionalUserInfo);
                print(userCredential!.additionalUserInfo);
              },
              child: Text('회원가입'),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              color: Colors.white,
              splashColor: Colors.blue,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Container buildLoginScreen() {
    return Container(
        color: Colors.red, height: 300, child: (Text('logged in now')));
  }
}
