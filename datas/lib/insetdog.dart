import 'dart:math';

import 'package:datas/dbf/dog.dart';
import 'package:datas/helper/datahelper.dart';
import 'package:flutter/material.dart';

class AddDogScreen extends StatefulWidget {
  const AddDogScreen({super.key});

  @override
  State<AddDogScreen> createState() => _AddDogScreenState();
}

class _AddDogScreenState extends State<AddDogScreen> {
  final _fromKey = GlobalKey<FormState>();
  String name = "";
  String age = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Dog")),
      body: Form(
        key: _fromKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: "Add Dog name"),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              validator: ((value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              }),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Add Dog Age"),
              onChanged: (value) {
                setState(() {
                  age = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                if (_fromKey.currentState!.validate()) {
                  await DatabaseHandler().insertDog(
                    Dog(
                      name: name,
                      age: int.parse(age),
                      id: Random().nextInt(50),
                    ),
                  );
                }
              },
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
