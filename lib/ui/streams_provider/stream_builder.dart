import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_thingies/domain/view_models/streams_view_model.dart';

class StreamBuilderExamp extends StatelessWidget {
  const StreamBuilderExamp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Builder example"),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(top: 20, end: 20, start: 20),
        child: Selector<StreamsViewModel , Stream<int>>(
          selector: (ctx, vm) => vm.periodic,
          builder: (ctx, stream, child) {
            return StreamBuilder(
              stream: stream,
              builder: (context, snapshot) {
                return Text("New value => ${snapshot.data}");
              }
            );
          },

        ),
      ),
    );
  }
}
