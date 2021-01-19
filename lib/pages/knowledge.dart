import 'package:flutter/material.dart';
import 'package:muttaqi/widgets/load_html.dart';
import 'package:muttaqi/widgets/custom_list.dart';

class Knowledge extends StatefulWidget {
  @override
  _KnowledgeState createState() => _KnowledgeState();
}

class _KnowledgeState extends State<Knowledge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Knowledge"),
          elevation: 0,
    ),
        backgroundColor: Theme.of(context).primaryColor,
        body: ListView(
        children: [
          CustomList("Step by Step Salah", "Learn details by Taping this", ()=>WebViewLoad(assetHTML:'assets/Fivesalah.html'),assetImage: "assets/stepspic.png",)
        ],
      )
    );
  }
}
