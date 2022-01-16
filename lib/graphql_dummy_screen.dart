import 'package:flutter/material.dart';

import 'api.dart';

class GraphQlDummyScreen extends StatefulWidget {
  const GraphQlDummyScreen({Key? key}) : super(key: key);

  @override
  _GraphQlDummyScreenState createState() => _GraphQlDummyScreenState();
}

class _GraphQlDummyScreenState extends State<GraphQlDummyScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<String>(
          future: ApiClients().createCase(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text(snapshot.data),
                  StreamBuilder(
                    stream: ApiClients().caseResults(snapshot.data),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data.toString());
                      } else {
                        return Column(
                          children: [
                            // getCircularProgressIndicator(),
                            Text(snapshot.connectionState.name)
                          ],
                        );
                      }
                    },
                  ),
                ],
              );
            } else {
              return const CircularProgressIndicator();
              // Text(snapshot.connectionState.name);
            }
          },
        ),
      ),
    );
  }
}
