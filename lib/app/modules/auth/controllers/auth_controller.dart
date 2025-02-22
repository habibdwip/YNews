import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var isPasswordHidden = true.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailRegController = TextEditingController();
  TextEditingController passRegController = TextEditingController();

  Future login() async {
    isLoading(true);
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    isLoading(false);
    Get.snackbar('Success', 'Login berhasil',
        snackPosition: SnackPosition.BOTTOM);
  }

  void register() async {
    isLoading(true);
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailRegController.text, password: passRegController.text);
    isLoading(false);
    Get.snackbar('Success', 'Register berhasil',
        snackPosition: SnackPosition.BOTTOM);
  }
}
