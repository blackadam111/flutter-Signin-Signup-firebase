import 'package:ecommerce_project/const/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthTextWidget extends StatelessWidget {
  final String textHint;
  TextInputType? type;
  final IconData icon;
  TextEditingController controller;
  bool iconValue;
  bool obsecureText;
  Widget widget;
  AuthTextWidget(
      {super.key,
      required this.textHint,
      this.type = TextInputType.name,
      required this.icon,
      required this.controller,
      this.iconValue = false,
      this.obsecureText = false,
      this.widget = const SizedBox()});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
          color: lightcolor, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: type,
              textAlignVertical: TextAlignVertical.center,
              obscureText: obsecureText,
              decoration: InputDecoration(
                  hintText: textHint,
                  hintStyle: TextStyle(color: textcolor),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  prefixIcon: Icon(
                    icon,
                    color: buttonColor,
                  ),
                  border: InputBorder.none),
            ),
          ),
          iconValue == true ? widget : const SizedBox()
        ],
      ),
    );
  }
}
