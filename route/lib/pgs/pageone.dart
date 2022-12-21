import 'package:flutter/material.dart';

class FirsrstScreen extends StatelessWidget {
  final txtControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: txtControler,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term'),
            ),
          ),
          ElevatedButton(
            onPressed: () => {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    content: Text(txtControler.text),
                  );
                },
              )
            },
            child: const Text("Get Text"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second',
                  arguments: "This is first argument from first page");
            },
            child: const Text("Lauch Screen"),
          ),
        ],
      )),
    );
  }
}
