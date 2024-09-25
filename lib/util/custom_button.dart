import "package:flutter/material.dart";

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
