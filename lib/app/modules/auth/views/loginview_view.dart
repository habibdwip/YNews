import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:y_news/app/modules/auth/controllers/auth_controller.dart';
import 'package:y_news/app/modules/auth/views/registerview_view.dart';
import 'package:y_news/app/routes/app_pages.dart';

class LoginView extends GetView<AuthController> {
  LoginView({super.key});
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: authController.emailController,
              decoration: InputDecoration(labelText: 'Email'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty || value == "") {
                  return "Email can't be empty";
                } else if (!value.trim().contains("@")) {
                  return "Email not valid";
                }
                return null;
              },
              onSaved: (newValue) {
                authController.emailController.text = newValue!;
              },
            ),
            Obx(() => TextField(
                  controller: authController.passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(authController.isPasswordHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        authController.isPasswordHidden.value =
                            !authController.isPasswordHidden.value;
                      },
                    ),
                  ),
                  obscureText: authController.isPasswordHidden.value,
                )),
            SizedBox(height: 20),
            Obx(() => authController.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      await authController.login();
                      Get.offAndToNamed(Routes.HOME);
                    },
                    child: Text('Login'),
                  )),
            TextButton(
              onPressed: () => Get.to(RegisterView()),
              child: Text('Belum punya akun? Register'),
            )
          ],
        ),
      ),
    );
  }
}
