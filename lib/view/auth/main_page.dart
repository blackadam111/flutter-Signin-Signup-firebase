import 'package:ecommerce_project/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            child: ElevatedButton(
                onPressed: () {
                  authController.signOut();
                },
                child: const Text("SignOut")),
          ),
        ],
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                    color: Colors.yellow, shape: BoxShape.circle),
              ),
            ],
          )),
    );
  }
}
