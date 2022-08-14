import 'package:flutter/material.dart';
import 'package:provider_thingies/ui/streams_provider/add_to_stream.dart';
import 'package:provider_thingies/ui/streams_provider/gen_streams.dart';
import 'package:provider_thingies/ui/streams_provider/stream_builder.dart';

class StreamsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Streams Home"),
      ),
      body: Center(
        child: ListView(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => GenStreams()));
                },
                child: Text("Gen streams")),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => StreamBuilderExamp()));
                },
                child: Text("Stream builder examp")),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AddToStreamPage()));
                },
                child: Text("Stream add+sink examp")),
          ],
        ),
      ),
    );
  }
}
