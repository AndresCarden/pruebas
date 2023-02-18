import 'package:flutter/material.dart';


class SmallButtonWidget extends StatelessWidget {
  final String title;
  final onPressed;

  const SmallButtonWidget({Key? key, required this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 14
        ),
      ),
    );
  }
}