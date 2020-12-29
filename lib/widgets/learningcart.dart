import 'package:flutter/material.dart';

class LearningCart extends StatelessWidget {

  final String assetimage;
  final String descriptiontext;
  final String title;
  final String subtitle;
  final Function page;


  LearningCart(this.title,this.subtitle,this.assetimage,this.descriptiontext,this.page,);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top:8.0,left:8.0,right:8.0),
        child: Card(
          elevation: 2.0,
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Image.asset(assetimage),
              ListTile(
                //leading: Icon(Icons.arrow_drop_down_circle),
                title: Text(title),
                subtitle: Text(
                  subtitle,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  descriptiontext,
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
    );
  }
}
