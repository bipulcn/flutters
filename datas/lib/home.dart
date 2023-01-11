import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = ((prefs.getInt('counter') ?? 0) + 1);
      prefs.setInt('counter', _counter);
    });
  }

  void _calleven() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int num = prefs.getInt('counter') ?? 0;
    debugPrint(num.toString());
  }

  void loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
    int num = prefs.getInt('counter') ?? 0;
    debugPrint("working great ");
    debugPrint(num.toString());
  }

  @override
  void initState() {
    super.initState();
    loadCounter();
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
                onPressed: () => {_calleven()}, child: const Text("Call Me")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/save');
                },
                child: const Text("Save Data")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/view');
                },
                child: const Text("Check Data")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/lview');
                },
                child: const Text("Check View")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/ndog');
                },
                child: const Text("New Dog")),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Alert Dialog'),
                      content: const Text("hello world"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              debugPrint("hello world");
                              Navigator.pop(context);
                            },
                            child: const Text("cancle")),
                        TextButton(
                            onPressed: () {
                              debugPrint("Action was executed");
                              Navigator.of(context, rootNavigator: true)
                                  .pop('dialog');
                            },
                            child: const Text("Yes"))
                      ],
                    ),
                  );
                },
                child: const Text("Alert"))
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
