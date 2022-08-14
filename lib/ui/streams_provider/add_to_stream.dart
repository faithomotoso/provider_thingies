import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_thingies/domain/view_models/streams_view_model.dart';

class AddToStreamPage extends StatefulWidget {
  const AddToStreamPage({Key? key}) : super(key: key);

  @override
  State<AddToStreamPage> createState() => _AddToStreamPageState();
}

class _AddToStreamPageState extends State<AddToStreamPage> {
  final TextEditingController textEditingController = TextEditingController();
  late final StreamsViewModel streamsViewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    streamsViewModel = Provider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Addding to stream"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Selector<StreamsViewModel, Stream<int>>(
              selector: (ctx, vm) => vm.generateRandomInts(),
              builder: (ctx, stream, child) {
                return StreamBuilder(
                  stream: stream,
                  builder: (context, snapshot) {
                    return Text("Value from stream: ${snapshot.data}");
                  },
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: textEditingController,
            ),
            TextButton(
                onPressed: () {
                  streamsViewModel.addToStreamController(
                      string: textEditingController.text);
                },
                child: Text("Add to stream controller")),
            TextButton(
                onPressed: () {
                  streamsViewModel.addToStreamSink(
                      string: textEditingController.text);
                },
                child: Text("Add to stream sink")),
          ],
        ),
      ),
    );
  }
}
