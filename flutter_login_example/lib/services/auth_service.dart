import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  //Check for Google Login
  Future<FirebaseUser> isSignedIn() async {
    bool isSignedIn = await googleSignIn.isSignedIn();

    if (isSignedIn) {
      FirebaseUser user = await auth.currentUser();

      return user;
    } else {
      return null;
    }
  }

  //Signs the user in using Google
  Future<FirebaseUser> signInWithGoogle() async {
    //1. Initialize the Google SignIn object
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    //2. Add the Credentials
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    //3. Get the Auth Result for this user
    final AuthResult authResult = await auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    //4. Return the user object
    return user;
  }

  //Signs out the user
  Future<void> signOutWithGoogle() async {
    await googleSignIn.signOut();
    await auth.signOut();
  }
}
