import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:y_news/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAllNamed(Routes.AUTH);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text(
          "Hello ${FirebaseAuth.instance.currentUser?.email}",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
