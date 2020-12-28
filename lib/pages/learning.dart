import 'package:flutter/material.dart';
import 'package:muttaqi/pages/salat_rules_html.dart';

class Learning extends StatefulWidget {
  @override
  _LearningState createState() => _LearningState();
}

class _LearningState extends State<Learning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WebViewLoad()),
              );
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  // ListTile(
                  //   leading: Icon(Icons.arrow_drop_down_circle),
                  //   title: const Text('Card title 1'),
                  //   subtitle: Text(
                  //     'Secondary Text',
                  //     style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  //   ),
                  // ),
                  Image.asset('assets/stepspic.png'),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  // ButtonBar(
                  //   alignment: MainAxisAlignment.start,
                  //   children: [
                  //     FlatButton(
                  //       textColor: const Color(0xFF6200EE),
                  //       onPressed: () {
                  //         // Perform some action
                  //       },
                  //       child: const Text('ACTION 1'),
                  //     ),
                  //     FlatButton(
                  //       textColor: const Color(0xFF6200EE),
                  //       onPressed: () {
                  //         // Perform some action
                  //       },
                  //       child: const Text('ACTION 2'),
                  //     ),
                  //   ],
                  // ),

                  //Image.asset('assets/stepspic.png'),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
