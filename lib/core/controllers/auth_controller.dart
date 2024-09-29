import 'package:focus_flow/Layouts/widgets/dialogues/alert_dialogue.dart';
import 'package:focus_flow/core/dependencies/firebase_ref.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart' as logger;


class AuthController extends GetxController{


  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;
  late FirebaseAuth _auth;

  void initAuth() async{
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user){
      _user.value = user;
    });
    navigateToIntro();
  }
  void navigateToIntro(){
    Get.offAllNamed("/intro");
  }
  signInWithGoogle() async{
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try{
        GoogleSignInAccount? _googleSignInAcc = await _googleSignIn.signIn();
        if(_googleSignInAcc != null){
          final _authAcc = await  _googleSignInAcc.authentication;
          final _credential = GoogleAuthProvider.credential(
            idToken: _authAcc.idToken,
            accessToken: _authAcc.accessToken,
          );
          await _auth.signInWithCredential(_credential);
          await saveUser(_googleSignInAcc);
        }
    }on Exception catch(error){
      // logger.e(error);
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
          Get.back();
          ///Navigate to login page
    }),
    barrierDismissible: false
    );

  }

  bool isLoggedIn(){
    return _auth.currentUser != null;
  }
  @override
  void onReady(){
    initAuth();
    super.onReady();
  }
}