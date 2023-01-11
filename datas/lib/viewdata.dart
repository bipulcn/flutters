import 'package:datas/dbf/data.dart';
import 'package:datas/helper/dbhelper.dart';
import 'package:flutter/material.dart';

class ViewDatas extends StatefulWidget {
  const ViewDatas({super.key});

  @override
  State<ViewDatas> createState() => _ViewDatasState();
}

class _ViewDatasState extends State<ViewDatas> {
  Future<List<Note>>? _notes;
  late SqliteService handler;

  @override
  void initState() {
    super.initState();
    handler = SqliteService();
    handler.initdb().whenComplete(() async {
      setState(() {
        _notes = getList();
      });
    });
  }

  Future<List<Note>> getList() async {
    return await handler.notes();
  }

  Future<void> _onRefresh() async {
    setState(() {
      _notes = getList();
    });
  }

  // void _queryAll() async {
  //   final allRows = await SqliteService().getItems();
  //   Notes.clear();
  //   allRows.forEach((row) {
  //     debugPrint(row.toString());
  //     // row.map((key, value) {
  //     //   debugPrint(value);
  //     // });
  //   });
  //   // _showMessageInScaffold('Query done.');
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder<List<Note>>(
            future: _notes,
            builder:
                (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final items = snapshot.data ?? <Note>[];
                return Scrollbar(
                  child: RefreshIndicator(
                    onRefresh: _onRefresh,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: const Icon(Icons.delete_forever),
                          ),
                          key: ValueKey<int>(items[index].id ?? 0),
                          direction: DismissDirection.endToStart,
                          onDismissed: (DismissDirection direction) async {
                            await handler.delteNote(items[index].id ?? 0);
                            setState(() {
                              items.remove(items[index]);
                            });
                          },
                          child: Card(
                            child: ListTile(
                              title: Text(items[index].title ?? ''),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            },
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
      future: SqliteService().notes(),
      // initialData: List(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? new ListView.builder(
                shrinkWrap: true,
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
