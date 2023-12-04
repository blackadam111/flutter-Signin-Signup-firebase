import 'package:ecommerce_project/const/constants.dart';
import 'package:ecommerce_project/controllers/auth_controller.dart';
import 'package:ecommerce_project/utili/auth_button_widget.dart';
import 'package:ecommerce_project/utili/auth_text_widget.dart';
import 'package:ecommerce_project/view/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Obx(
            () => Column(
              children: [
                Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 26,
                      color: textcolor,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Create your new account",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthTextWidget(
                  controller: authController.name,
                  textHint: "UserName",
                  //type: TextInputType.name,
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 10,
                ),
                AuthTextWidget(
                  controller: authController.email,
                  textHint: "Email",
                  type: TextInputType.emailAddress,
                  //type: TextInputType.name,
                  icon: Icons.person,
                ),
                const SizedBox(height: 10),
                AuthTextWidget(
                  obsecureText: authController.obsecureText.value,
                  controller: authController.passWord,
                  textHint: "Password",
                  //type: TextInputType.name,
                  icon: Icons.person,
                  iconValue: true,
                  widget: IconButton(
                      onPressed: () {
                        authController.hidePassword();
                      },
                      icon: const Icon(Icons.remove_red_eye)),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => AuthButton(
                    name: authController.loading.value ? "Loading" : "SignUp",
                    fn: () {
                      authController.signUp();
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
                      "Already have an account",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => LogIn());
                      },
                      child: Text(
                        "Signin",
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
            ),
          )),
    );
  }
}
