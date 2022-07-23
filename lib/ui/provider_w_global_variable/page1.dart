import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_thingies/domain/view_models/random_view_model.dart';
import 'package:provider_thingies/main.dart';
import 'package:provider_thingies/ui/provider_w_global_variable/page2.dart';

class Intermid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: randomViewModel,
      builder: (ctx, _) {
        return Page1();
      },
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RandomViewModel randomViewModel = Provider.of<RandomViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Count: ${randomViewModel.counter.toString()}"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      randomViewModel.increaseCounter();
                    },
                    child: Text("Increment")),
                const SizedBox(
                  width: 50,
                ),
                TextButton(
                    onPressed: () {
                      randomViewModel.decreaseCounter();
                    },
                    child: Text("Decrement")),
              ],
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => Page2()));
                },
                child: Text("Navigate to page 2"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
