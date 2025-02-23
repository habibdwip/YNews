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
                authController.emailRegController.text = newValue!;
              },
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
                  validator: (value) {
                    if (value!.trim().isEmpty || value == "") {
                      return "Password can't be empty";
                    } else if (value.trim().length < 6) {
                      return "Password should more than 6 character";
                    }
                    return null;
                  },
                  obscureText: authController.isPasswordHidden.value,
                  onSaved: (newValue) {
                    authController.passRegController.text = newValue!;
                  },
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
