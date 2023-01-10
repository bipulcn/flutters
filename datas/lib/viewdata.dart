import 'package:datas/dbf/data.dart';
import 'package:datas/helper/dbhelper.dart';
import 'package:flutter/material.dart';

class ViewDatas extends StatefulWidget {
  const ViewDatas({super.key});

  @override
  State<ViewDatas> createState() => _ViewDatasState();
}

class _ViewDatasState extends State<ViewDatas> {
  List<Note> Notes = [];
  List<Note> NotesByName = [];

  void _queryAll() async {
    final allRows = await SqliteService.getItems();
    Notes.clear();
    allRows.forEach((row) {
      debugPrint(row.toString());
      // row.map((key, value) {
      //   debugPrint(value);
      // });
    });
    // _showMessageInScaffold('Query done.');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Scrollbar(child: userWidget()),
              ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _queryAll();
                    });
                    dynamic rw = await SqliteService.getItems();
                    debugPrint(rw.toString());
                  },
                  child: Icon(Icons.download)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/'),
        child: const Icon(Icons.home),
      ),
    );
  }

  Widget userWidget() {
    return FutureBuilder<List>(
      future: SqliteService.getItems(),
      // initialData: List(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? new ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i) {
                  debugPrint(snapshot.data.toString());
                  // return _buildRow(snapshot.data[]);
                  return _buildRow(snapshot.data?[0]);
                },
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildRow(Note fruit) {
    return new ListTile(
      title: new Text('Note.title', style: TextStyle(fontSize: 18.0)),
    );
  }
}
