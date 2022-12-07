import 'package:flutter/material.dart';
import 'package:practice/base/templates.dart';

class Routers extends StatelessWidget {
  const Routers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          // ListTtl('Dashboard', () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => HomePage()),
          //   );
          // }, Icons.dashboard),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
