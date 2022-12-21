import 'package:barcodetst/rute/create.dart';
import 'package:barcodetst/rute/parent.dart';
import 'package:barcodetst/rute/scans.dart';

import 'package:flutter/material.dart';

void main() {
  // runApp(const MyApp());
  runApp(MaterialApp(
    title: "Barcode Reading",
    initialRoute: "/",
    routes: {
      "/": (context) => const ParentPage(),
      "/scan": (context) => const ScanPage(),
      "/make": (context) => const CreatePage()
    },
  ));
}
