import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_thingies/domain/view_models/random_view_model.dart';
import 'package:provider_thingies/domain/view_models/streams_view_model.dart';
import 'package:provider_thingies/domain/view_models/user_view_model.dart';
import 'package:provider_thingies/ui/future_provider/future_provider_exp.dart';
import 'package:provider_thingies/ui/provider_w_global_variable/page1.dart';
import 'package:provider_thingies/ui/streams_provider/h.dart';

void main() {
  runApp(const MyApp());
}

RandomViewModel randomViewModel = RandomViewModel();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: randomViewModel),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => StreamsViewModel())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: EntryPoint(),
      ),
    );
  }
}

class EntryPoint extends StatelessWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Exp"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            _button(
                text: "Provider w global variable",
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => Intermid()));
                }),
            _button(
                text: "Future provider",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => FutureProviderExp()));
                }),
            _button(
                text: "Streams",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => StreamsHome()));
                }),
          ],
        ),
      ),
    );
  }

  Widget _button({required String text, required VoidCallback onTap}) {
    return ElevatedButton(onPressed: onTap, child: Text(text));
  }
}
