import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_thingies/domain/view_models/random_view_model.dart';
import 'package:provider_thingies/main.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Build method called in page2");
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: Column(
        children: [
          ChangeNotifierProvider.value(
            value: randomViewModel,
            builder: (ctx, _) {
              RandomViewModel _randomViewModel = Provider.of(context);
              return Center(
                child: Column(
                  children: [
                    Text("Counter: ${_randomViewModel.counter}"),
                  ],
                ),
              );
            },
          ),
          TextButton(
              onPressed: () {
                randomViewModel.increaseCounter();
              },
              child: Text("Increment")),
          Text("Counter from normal variable: ${randomViewModel.counter}"),
        ],
      ),
    );
  }
}
