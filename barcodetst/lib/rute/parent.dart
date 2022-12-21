import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ParentPage extends StatelessWidget {
  const ParentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "QR code Scaner",
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    "Hello world",
                    style: TextStyle(fontSize: 30.0),
                  ),
                  margin: EdgeInsets.only(top: 40.0),
                  padding: EdgeInsets.all(20.0),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/',
                        arguments: "This is first argument from first page");
                  },
                  child: const Text("Lauch Screen"),
                ),
                ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/scan',
                        arguments: "This is first argulment")
                  },
                  child: const Text("Scan QR"),
                ),
                ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, '/make',
                        arguments: "Scan page")
                  },
                  child: const Text("Make QR"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
