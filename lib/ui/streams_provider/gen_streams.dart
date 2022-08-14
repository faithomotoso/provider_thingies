import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_thingies/domain/view_models/streams_view_model.dart';

class GenStreams extends StatefulWidget {
  const GenStreams({Key? key}) : super(key: key);

  @override
  State<GenStreams> createState() => _GenStreamsState();
}

class _GenStreamsState extends State<GenStreams> {
  late StreamsViewModel streamsViewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    streamsViewModel = Provider.of<StreamsViewModel>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gen streams"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text("List values from a stream generator function"),
            TextButton(
                onPressed: () {
                  streamsViewModel.processRandoms();
                },
                child: Text("Trigger streams processing")),
            TextButton(
                onPressed: () {
                  streamsViewModel.streamsMethods();
                },
                child: Text("Streams Method")),
            TextButton(
                onPressed: () {
                  streamsViewModel.streamSubscription();
                },
                child: Text("Stream Subscription")),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
              builder: (ctx, snapshot) {
                print(snapshot);
                return Text(snapshot.data.toString());
              },
              stream:
                  Provider.of<StreamsViewModel>(context).generateRandomInts(),
            )
          ],
        ),
      ),
    );
  }
}
