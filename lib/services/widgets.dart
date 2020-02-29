import 'package:flutter/material.dart';

class WidgetsList with ChangeNotifier {
  List<Widget> _list = List<Widget>();
  List<Widget> get getlist => _list;

  bool get isEmpty => _list.isEmpty;

  void addToList(String title, double cut) {
    _list.add(
      ListTile(
        title: Text(title ?? ''),
        subtitle: Text(cut.toString() ?? 0),
        leading: Icon(Icons.money_off),
      ),
    );
    notifyListeners();
  }
}
