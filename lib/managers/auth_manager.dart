import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class AuthManager extends ChangeNotifier {
  UserCredential? _userCredential;

  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    SharedPreferences _cachedAuth = await SharedPreferences.getInstance();
    _cachedAuth.setString('accessToken', googleAuth.accessToken!);
    await _cachedAuth.setString('idToken', googleAuth.idToken!);
    _userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
  }

  void tryInitialLogin() async {
    SharedPreferences _cachedAuth = await SharedPreferences.getInstance();
    String? accessToken = _cachedAuth.getString('accessToken');
    String? idToken = _cachedAuth.getString('idToken');
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: accessToken,
      idToken: idToken,
    );
    _userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
  }

  bool checkIfValidAuth() {
    return FirebaseAuth.instance.currentUser != null;
  }

  Future<void> signOut() async {
    SharedPreferences _cachedAuth = await SharedPreferences.getInstance();
    await FirebaseAuth.instance.signOut();
    print(checkIfValidAuth());
    _cachedAuth.remove('accessToken');
    _cachedAuth.remove('idToken');
    notifyListeners();
  }

  String? getDisplayName() {
    return FirebaseAuth.instance.currentUser!.displayName;
  }
}
