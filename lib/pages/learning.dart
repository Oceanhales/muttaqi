import 'package:flutter/material.dart';
import 'package:muttaqi/pages/salat_rules_html.dart';
import 'package:muttaqi/widgets/learningcart.dart';

class Learning extends StatefulWidget {
  @override
  _LearningState createState() => _LearningState();
}

class _LearningState extends State<Learning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: ListView(
        children: [
          LearningCart("How to perform Five salah Step by Step","Learn details by Taping this","assets/stepspic.png",
              "The primary purpose of salah is to act as a person's communication with Allah."
                  "Purification of the heart is the ultimate religious objective of Salah. "
                  "Via namaz, a believer can grow closer to Allah and in turn strengthen their faith. "
                  "Just as humans physically require food and supplement to stay healthy and alive, "
                  "the soul requires prayer and closeness to God to stay sustained and healthy. "
                  "In short, it spiritually sustains the human soul.", ()=>WebViewLoad()),
          //LearningCart("assets/stepspic.png", "this is a test", ()=>WebViewLoad()),
        ],
      )
    );
  }
}
