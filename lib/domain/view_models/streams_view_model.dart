import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class StreamsViewModel extends ChangeNotifier {
  Stream<int> periodic = Stream<int>.periodic(
    const Duration(seconds: 1),
    (computationCount) => Random().nextInt(1000000),
  );

  StreamController<String> streamController = StreamController();


  @override
  void dispose() {
    streamController.close();
  }

  void addToStreamController({required String string}) {
    streamController.add(string);
  }

  void addToStreamSink({required String string}) {
    streamController.sink.add(string);
  }

  Stream<int> generateRandomInts() async* {

    Random random = Random();

    for (int i = 0; i < 20; i++) {
      print("i => $i");
      if (i == 11) {
        throw Exception("Haq haq haq");
      }

      yield random.nextInt(999);
    }
  }

  Future<void> processRandoms() async {
    int sum = 0;

    try {
      await for (int n in generateRandomInts()) {
        print("Gotten number: $n");
        sum += n;
      }
    } on Exception catch (e) {
      print("Oops! Error iterating through the stream: $e");
    }

    print("Sum of everything is: $sum");
  }

  void streamsMethods() async {
    Stream<int> stream = generateRandomInts();
    print("First in the stream: ${await stream.first}");
    print("Last in the stream: ${await stream.last}");
  }

  void streamSubscription() {
    StreamSubscription<int> streamSubscription = generateRandomInts().listen(
        (event) {
          print("Listen handler in stream subscription: $event");
        },
        cancelOnError: false,
        onError: (error) {
          print("Error at stream sub: $error");
        });
  }
}
