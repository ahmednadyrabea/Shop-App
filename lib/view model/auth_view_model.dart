import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop/home.dart';

class AuthViewModel extends GetxController {
  late String email, password, name;
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  createUser() async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("Erorr", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  signUser() async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.to(Home());
    } catch (e) {
      Get.snackbar("Erorr", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void googleAcount() async {
    await googleSignIn.signIn();
    Get.to(Home());
  }
}
