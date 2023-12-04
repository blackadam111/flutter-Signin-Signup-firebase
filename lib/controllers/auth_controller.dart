import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_project/models/user_model.dart';
import 'package:ecommerce_project/view/auth/login_page.dart';
import 'package:ecommerce_project/view/auth/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //create instance
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController email = TextEditingController();
  TextEditingController passWord = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  var loading = false.obs;
  var obsecureText = false.obs;
  //sign up function
  signUp() async {
    loading.value = true;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email.text, password: passWord.text);
      await addUser(UserModel(
          email: auth.currentUser?.email,
          name: name.text,
          id: auth.currentUser?.uid));
      loading.value = false;
      Get.offAll(() => MainPage());
    } catch (e) {
      loading.value = false;
      Get.snackbar("error", "$e");
    }
  }

  logIn() async {
    try {
      loading.value = true;
      await auth.signInWithEmailAndPassword(
          email: loginEmail.text, password: loginPassword.text);
      loading.value = false;
      Get.offAll(() => MainPage());
    } catch (e) {
      loading.value = false;
      Get.snackbar("error", "$e");
    }
  }

  addUser(UserModel userModel) async {
    try {
      await db
          .collection("users")
          .doc(auth.currentUser?.uid)
          .collection("loginCredential")
          .add(userModel.toMap());
    } catch (e) {
      Get.snackbar("error", "$e");
    }
  }

  signOut() async {
    await auth.signOut();
    Get.offAll(() => LogIn());
  }

  hidePassword() {
    obsecureText.value = !obsecureText.value;
  }
}
