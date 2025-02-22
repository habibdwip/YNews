import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:y_news/app/modules/auth/controllers/auth_controller.dart';

class RegisterView extends GetView<AuthController> {
  RegisterView({super.key});
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: authController.emailRegController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            Obx(() => TextFormField(
                  controller: authController.passRegController,
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
            Obx(
              () => authController.isLoading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        authController.register();
                      },
                      child: Text('Register'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
