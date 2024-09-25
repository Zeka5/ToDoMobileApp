import "package:flutter/material.dart";
import "package:todo_list_app/util/custom_button.dart";

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[200],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  text: "Save",
                  onPressed: onSave,
                ),
                const SizedBox(width: 50), //sluzi za postavljanje razmaka
                CustomButton(
                  text: "Cancel",
                  onPressed: onCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
