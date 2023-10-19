import 'package:flutter/material.dart';

class ExpandList extends StatefulWidget {
  @override
  _ExpandListState createState() => _ExpandListState();
}

class _ExpandListState extends State<ExpandList> {
  List<Item> _items = [
    Item(
      header: 'Header 1',
      body: 'Body 1',
      isExpanded: false,
    ),
    Item(
      header: 'Header 2',
      body: 'Body 2',
      isExpanded: false,
    ),
    Item(
      header: 'Header 3',
      body: 'Body 3',
      isExpanded: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List with Sublist'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _items[index].isExpanded = !isExpanded;
            });
          },
          children: _items.map((item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(item.header),
                );
              },
              body: ListTile(
                title: Text(item.body),
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Item {
  String header;
  String body;
  bool isExpanded;

  Item({
    required this.header,
    required this.body,
    required this.isExpanded,
  });
}
