import 'package:datas/dbf/dog.dart';
import 'package:datas/helper/datahelper.dart';
import 'package:flutter/material.dart';

class ViewListPage extends StatefulWidget {
  const ViewListPage({super.key});

  @override
  State<ViewListPage> createState() => _ViewListPageState();
}

class _ViewListPageState extends State<ViewListPage> {
  late DatabaseHandler handler;
  Future<List<Dog>>? _dogs;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      debugPrint("Working Started");
      setState(() {
        _dogs = getList();
      });
    });
  }

  Future<List<Dog>> getList() async {
    return await handler.dogs();
  }

  Future<void> _onRefresh() async {
    setState(() {
      _dogs = getList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Item List"),
          leading: BackButton(
            onPressed: () => Navigator.pushNamed(context, "/"),
          ),
        ),
        body: FutureBuilder<List<Dog>>(
          future: _dogs,
          builder: (BuildContext context, AsyncSnapshot<List<Dog>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final items = snapshot.data ?? <Dog>[];
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
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: const Icon(Icons.delete_forever),
                        ),
                        key: ValueKey<int>(items[index].id),
                        direction: DismissDirection.endToStart,
                        onDismissed: (DismissDirection direction) async {
                          await handler.deleteDog(items[index].id);
                          setState(() {
                            items.remove(items[index]);
                          });
                        },
                        child: Card(
                          child: ListTile(
                              contentPadding: const EdgeInsets.all(8.0),
                              title: Text(items[index].name),
                              subtitle: Text(items[index].age.toString()),
                              onLongPress: () {
                                debugPrint("hellow world");
                              }),
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
    );
  }
}
