import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/', arguments: 'Sample Argument');
        },
        child: const Text('Go Back'),
      )),
    );
  }
}
