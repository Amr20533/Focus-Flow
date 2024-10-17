import 'package:flutter/material.dart';
import 'package:focus_flow/Layouts/widgets/dialogues/alert_dialogue.dart';
import 'package:focus_flow/core/dependencies/firebase_ref.dart';
import 'package:focus_flow/utils/static/routes.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';


class AuthController extends GetxController{

  final Logger _logger = Logger();

  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;
  late FirebaseAuth _auth;

  @override
  void onReady(){
    super.onReady();
    initAuth();
  }

  Future<void> initAuth() async{
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user!;
    });
    await Future.delayed(const Duration(seconds: 2));
    navigateToIntro();
  }

  void navigateToIntro(){
    Get.offAllNamed(AppRoutes.onBoarding);
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      // Start the Google sign-in process
      GoogleSignInAccount? _googleSignInAcc = await _googleSignIn.signIn();

      // Check if the user completed the sign-in
      if (_googleSignInAcc != null) {
        final _authAcc = await _googleSignInAcc.authentication;

        // Create the credential for Firebase
        final _credential = GoogleAuthProvider.credential(
          idToken: _authAcc.idToken,
          accessToken: _authAcc.accessToken,
        );

        await _auth.signInWithCredential(_credential);
        await saveUser(_googleSignInAcc);
        navigateToHome();
      } else {
        debugPrint("Google sign-in was cancelled.");
      }
    } catch (error) {
      debugPrint("Error while signing in with Google: $error");
      _logger.e("Sign in error: $error");
    }
  }

  saveUser(GoogleSignInAccount account){
    userRF.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profileImage": account.photoUrl,

    });
  }

  // void navigateToHome(){
  //   Get.offNamed("/home");
  // }

  void showLoginAlertDialogue(){
    Get.dialog(Dialogues.questionStartDialogue(
      onPressed: (){
          // Get.back();
          navigateToLogin();
    }),
    barrierDismissible: false
    );

  }

  bool isLoggedIn(){
    // debugPrint("User ----> ${_auth!.currentUser}");
    return _auth.currentUser != null;
  }

  void navigateToLogin(){
    Get.toNamed(AppRoutes.login);
  }

  void navigateToHome(){
    Get.toNamed(AppRoutes.home);
  }

  User? getUser() {
    return _auth.currentUser;
  }


  Future<void> logOut() async{
    _logger.d("Sign out");
    try{
      await _auth.signOut();
      Get.offAllNamed(AppRoutes.home);
    }on FirebaseAuthException catch(error){
      debugPrint("Failed to Sign Out $error");
      _logger.e("Error while sign out: $error");

    }
  }




}