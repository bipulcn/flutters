import 'package:flutter/material.dart';
import 'pgs/pageone.dart';
import 'pgs/pagetwo.dart';

void main() {
  runApp(MaterialApp(
    title: 'Name Routes Demo',
    initialRoute: '/',
    routes: {
      '/': (context) => FirsrstScreen(),
      '/second': (context) => const SecondScreen()
    },
  ));
}
