import 'package:flutter/material.dart';
import 'package:bhavya/items.dart';

class CartModel extends ChangeNotifier {
  List<Items> _items = [];

  List<Items> get items => _items;

  void addItem(Items item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(Items item) {
    _items.remove(item);
    notifyListeners();
  }
}
