import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final LocalStorage _db = new LocalStorage('localstorage_app');
  void saveLoackStore() {
    _db.setItem('test', 'This is a test data saved in Local Storage');
  }

  void loadLoackStore() {
    String tst = _db.getItem('test') ?? "Data Was not Saved";
    log(tst);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: () => {saveLoackStore()},
                child: Text("Press To save")),
            Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton.icon(
                    onPressed: () => {loadLoackStore()},
                    onLongPress: () => {print("Long Pressed")},
                    label: Text("Press To Load"),
                    icon: Icon(Icons.web),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.amber, padding: EdgeInsets.all(20)))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
