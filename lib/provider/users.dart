import 'dart:math';

import 'package:flutter/material.dart';
import 'package:register/data/dummy_users.dart';

import '../models/user.dart';

class Users extends ChangeNotifier {
  final Map<String, User> _items = {...users};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int index) {
    return _items.values.elementAt(index);
  }


  void addUser(User user) {
    if (_items.containsKey(user.id)) {
      editUser(user.id!, user);
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => User(
                id: id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
      notifyListeners();
    }
  }

  void removeUser(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void editUser(String id, User newUser) {
    if (_items.containsKey(id)) {
      _items.update(
          id,
          (_) => User(
                id: id,
                name: newUser.name,
                email: newUser.email,
                avatarUrl: newUser.avatarUrl,
              ));
      notifyListeners();
    }
  }
}
