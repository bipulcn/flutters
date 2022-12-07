import 'package:flutter/material.dart';
import 'package:practice/base/templates.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (_counter == 0)
                ? TxtShow(
                    txt: 'You have not push it for a single time:',
                    fsz: 22,
                    clr: Colors.blueAccent)
                : TxtShow(
                    txt: 'Your have clicked the button for: ',
                    fsz: 22,
                    clr: Colors.orangeAccent),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline3,
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
