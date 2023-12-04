import 'package:ecommerce_project/const/constants.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String? name;
  final void Function()? fn;
  const AuthButton({
    super.key,
    this.name,
    this.fn,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fn,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(15)),
        child: Text(
          name!,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
