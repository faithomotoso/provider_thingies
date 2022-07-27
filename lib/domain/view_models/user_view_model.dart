import 'package:flutter/material.dart';
import 'package:provider_thingies/domain/user.dart';

class UserViewModel extends ChangeNotifier {
  int r = 9909;

  Future<User> getUser() async {
    await Future.delayed(Duration(seconds: 3));

    return User(name: "Frank Donga", age: 99);
  }

  Future<int> getInt() async {
    await Future.delayed(Duration(seconds: 3));

    return 11;
  }
}
