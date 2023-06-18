import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:to_do/const/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20),
                  child: CustomButton(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
