// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todo_app/utilities/my_button.dart';

class DialogueBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogueBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Get user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),

            //buttons, save & cancel buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Cancel button
                CustomButton(name: "cancel", onPressed: onCancel),
                const SizedBox(
                  width: 10,
                ),
                CustomButton(name: "save", onPressed: onSave),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.yellow[400],
    );
  }
}
