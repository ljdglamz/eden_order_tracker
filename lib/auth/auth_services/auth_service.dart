import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  static dynamic signinWithGoogle() async {
    try {
      final GoogleSignInAccount? userDetails = await GoogleSignIn().signIn();

      if (userDetails == null) {
        return null;
      }
      final GoogleSignInAuthentication authUser =
          await userDetails.authentication;
      final userInfo = GoogleAuthProvider.credential(
        accessToken: authUser.accessToken,
        idToken: authUser.idToken,
      );

      FirebaseAuth.instance.signInWithCredential(userInfo);
      return FirebaseAuth.instance.currentUser;
    } catch (ex) {
      return null;
    }
  }

  static dynamic githubSigning() async {
    try {
      var githubUser =
          await FirebaseAuth.instance.signInWithProvider(GithubAuthProvider());
      if (githubUser.user == null) {
        return null;
      }
      return FirebaseAuth.instance.currentUser;
    } catch (ex) {
      return null;
    }
  }
}
