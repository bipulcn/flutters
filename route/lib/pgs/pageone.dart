import 'package:flutter/material.dart';

class FirsrstScreen extends StatelessWidget {
  const FirsrstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second',
                arguments: "This is first argument from first page");
          },
          child: const Text("Lauch Screen"),
        ),
      ),
    );
  }
}
