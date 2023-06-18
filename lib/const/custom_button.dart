import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Add ToDo',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
