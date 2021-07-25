import 'package:fashion1020/managers/auth_manager.dart';
import 'package:fashion1020/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthManager>(builder: (context, authManager, child) {
      try {
        if (authManager.checkIfValidAuth()) {
          return buildLoginScreen(authManager);
        } else {
          return buildNotLoginScreen(authManager);
        }
      } catch (e) {
        return buildNotLoginScreen(authManager);
      }
      // if (!authManager.isUserSignedIn()) {
      //   return buildNotLoginScreen(authManager);
      // } else {
      //   return buildLoginScreen(authManager);
      // }
    });
  }

  Container buildNotLoginScreen(AuthManager authManager) {
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
                authManager.signInWithGoogle();
              },
            ),
            SignInButton(
              Buttons.Google,
              text: '구글 계정으로 로그인',
              onPressed: () {
                authManager.signInWithGoogle();
              },
            ),
            SignInButton(
              Buttons.Facebook,
              text: '페이스북 계정으로 로그인',
              onPressed: () {
                authManager.signInWithGoogle();
              },
            ),
            RaisedButton(
              onPressed: () {
                // print(AuthManager.userCredential!.user);
                // print(AuthManager.userCredential!.additionalUserInfo);
                // print(AuthManager.userCredential!.additionalUserInfo);
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

  Widget buildLoginScreen(AuthManager authManager) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (SignInButton(
          Buttons.Google,
          text: '로그아웃',
          onPressed: () {
            authManager.signOut();
          },
        )),
        (SignInButton(
          Buttons.Google,
          text: '내 프로필 조회',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Material(
                    type: MaterialType.transparency,
                    child: ProfileScreen(
                        displayName: authManager.getDisplayName()!)),
              ),
            );
          },
        )),
      ],
    );
  }
}
