import 'package:flutter/material.dart';

class PageList extends StatefulWidget {
  const PageList({super.key});

  @override
  State<PageList> createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  final PageController _pageController = PageController(initialPage: 0);
  final List<String> pages = ['Page 1', 'Page 2', 'Page 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Scroll Layout'),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: pages.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
              child: Column(
            children: [
              Text(
                pages[index],
                style: const TextStyle(fontSize: 30),
              ),
              _buildPageIndicator(index),
            ],
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pageController.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }

  Widget _buildPageIndicator(int isCurrentPage) {
    return Column(children: [
      Text(
        "Hello world This one is from page indicator ${isCurrentPage}",
        style: const TextStyle(fontSize: 18),
      ),
      (pages.length > isCurrentPage + 1)
          ? ElevatedButton(
              onPressed: () {
                _pageController.nextPage(
                    duration: Duration(microseconds: 500),
                    curve: Curves.easeInOut);
              },
              child: Text("Let me " + (isCurrentPage + 2).toString()))
          : Text("working")
    ]);
  }
}
