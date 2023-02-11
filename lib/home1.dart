import 'package:flutter/material.dart';
import 'package:myapp/Newwidget.dart';
import 'package:myapp/Popularwidget.dart';

class Home1 extends StatelessWidget {
  const Home1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Popularwidget(),
        const SizedBox(
          height: 15,
        ),
        Newwidget(),
      ],
    );
  }
}
