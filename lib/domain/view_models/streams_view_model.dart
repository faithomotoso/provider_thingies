import 'dart:math';

import 'package:flutter/material.dart';

class StreamsViewModel extends ChangeNotifier {
  Stream<int> generateRandomInts() async* {
    Random random = Random();

    for (int i = 0; i < 20; i++) {
      yield i;
    }
  }
}