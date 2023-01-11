import 'package:datas/dbf/data.dart';
import 'package:datas/helper/dbhelper.dart';
import 'package:flutter/material.dart';

class InsertData extends StatefulWidget {
  const InsertData({super.key});

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  final TextEditingController name = TextEditingController();
  final TextEditingController detal = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    name.dispose();
    detal.dispose();
    super.dispose();
  }
  // InsertData.ensureInitialized();
  // final database =

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Your Name Please",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: detal,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Inser your age.",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      // Note not = new Note(
                      //     id: 1, title: name.text, description: detal.text);
                      await SqliteService().createItem(name.text, detal.text);
                    },
                    child: const Icon(Icons.save)),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/'),
        child: const Icon(Icons.home),
      ),
    );
  }
}
