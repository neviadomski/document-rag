import 'package:flutter/material.dart';

import 'package:doc_qa_front_end/screens/home/chat.dart';
import 'package:doc_qa_front_end/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document QA RAG'),
        centerTitle: true,
      ),
      drawer: MediaQuery.of(context).size.width < 600 ? LeftPaneDrawer() : null,
      endDrawer:
          MediaQuery.of(context).size.width < 600 ? RightPaneDrawer() : null,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          MediaQuery.of(context).size.width > 600
              ? LeftPaneRail()
              : Container(),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Placeholder(),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: MainChat(),
            ),
          ),
          MediaQuery.of(context).size.width > 600
              ? RightPaneRail()
              : Container(),
        ]),
      ),
    );
  }
}
