import 'dart:developer';

import 'package:datas/home.dart';
import 'package:datas/insert.dart';
import 'package:datas/insetdog.dart';
import 'package:datas/viewdata.dart';
import 'package:datas/viewlist.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: "This my Home page"),
        '/view': (context) => const ViewDatas(),
        '/save': (context) => const InsertData(),
        '/lview': (context) => const ViewListPage(),
        '/ndog': (context) => const AddDogScreen(),
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
