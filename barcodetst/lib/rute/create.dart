import 'package:flutter/material.dart';
// import 'package:barcode/barcode.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  QrImage imgs = QrImage(data: "", version: QrVersions.auto, size: 200.0);
  final txtControler = TextEditingController();

  void updateQrCode(String text) {
    setState(() {
      imgs = QrImage(
        data: text,
        version: QrVersions.auto,
        size: 200.0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Build Page",
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Create Barcode"),
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 40.0),
                    child: const Text("Create a QR Code",
                        style: TextStyle(fontSize: 24.0)),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: TextField(
                        controller: txtControler,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term'),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        updateQrCode(txtControler.text);
                      },
                      child: const Text("Generate")),
                  Container(color: Colors.white, child: imgs),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Create"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/',
                          arguments: "This is first argument from first page");
                    },
                    child: const Text("Back"),
                  ),
                  // SvgPicture.string(buildBarcode(
                  //   Barcode.code39(),
                  //   'CODE 39',
                  // ),
                  // ),
                ],
              ),
            )),
      ),
    );
  }
}

// class CreatePage extends StatelessWidget {
//   const CreatePage({super.key});
// }

/*
String buildBarcode(
  Barcode bc,
  String data, {
  String? filename,
  double? width,
  double? height,
  double? fontHeight,
}) {
  /// Create the Barcode
  final svg = bc.toSvg(
    data,
    width: width ?? 200,
    height: height ?? 80,
    fontHeight: fontHeight,
  );
  return svg;
  // Save the image
  // filename ??= bc.name.replaceAll(RegExp(r'\s'), '-').toLowerCase();
  // File('$filename.svg').writeAsStringSync(svg);
}
*/
