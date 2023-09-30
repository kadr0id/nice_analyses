import 'package:flutter/material.dart';

class MainAnalyses extends StatelessWidget {
  const MainAnalyses({super.key});

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => const MainAnalyses(),
      settings: const RouteSettings(name: '/main-analyses'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Main Analyses'),
          elevation: 0,
          backgroundColor: Colors.amber,
        ),
        body: Container(
          color: Colors.white,
          child: const SafeArea(
            child: MainAnalysesList(),
          ),
        ),
      ),
    );
  }
}

class ItemsList {
  List<ParentItem> generateParentItems(int count) {
    List<ParentItem> parentItems = [];
    for (int i = 1; i <= count; i++) {
      parentItems.add(
        ParentItem(
          'Type of analyses $i',
          generateChildItems(4),
        ),
      );
    }
    return parentItems;
  }

  List<ChildItem> generateChildItems(int count) {
    List<ChildItem> childItems = [];
    for (int i = 1; i <= count; i++) {
      childItems.add(
        ChildItem(
          'Unit of analysis $i',
          [],
        ),
      );
    }
    return childItems;
  }
}

class MainAnalysesList extends StatefulWidget {
  const MainAnalysesList({super.key});

  @override
  State<MainAnalysesList> createState() => _MainAnalysesListState();
}

class _MainAnalysesListState extends State<MainAnalysesList> {
  final ItemsList _itemsList = ItemsList();
  List<ParentItem> _parentItems = [];

  @override
  void initState() {
    super.initState();
    _parentItems = _itemsList.generateParentItems(5);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _parentItems.map((ParentItem parent) {
        return ExpansionTile(
          title: Text(parent.title),
          trailing: const Icon(
            Icons.add,
            size: 16,
          ),
          children: parent.children.map((ChildItem child) {
            return ListTile(
              title: Text(child.title),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}

class ParentItem {
  ParentItem(this.title, this.children);

  final String title;
  final List<ChildItem> children;
}

class ChildItem {
  ChildItem(this.title, this.children);

  final String title;
  final List<ChildItem> children;
}
