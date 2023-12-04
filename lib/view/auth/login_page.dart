import 'package:ecommerce_project/const/constants.dart';
import 'package:ecommerce_project/controllers/auth_controller.dart';
import 'package:ecommerce_project/utili/auth_button_widget.dart';
import 'package:ecommerce_project/utili/auth_text_widget.dart';
import 'package:ecommerce_project/view/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 26,
                    color: textcolor,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Sign in account",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              AuthTextWidget(
                controller: authController.loginEmail,
                textHint: "Email",
                type: TextInputType.emailAddress,
                //type: TextInputType.name,
                icon: Icons.person,
              ),
              const SizedBox(height: 10),
              AuthTextWidget(
                controller: authController.loginPassword,
                textHint: "Password",
                //type: TextInputType.name,
                icon: Icons.person,
              ),
              const SizedBox(height: 20),
              Obx(
                () => AuthButton(
                  name: authController.loading.value ? "Loading" : "Login",
                  fn: () {
                    authController.logIn();
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerRight,
                child: Text("Forgot Password?"),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => RegisterPage());
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: textcolor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              )
            ],
          )),
    );
  }
}
