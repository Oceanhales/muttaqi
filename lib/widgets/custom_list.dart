import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {

  final String assetImage;
  final String descriptionText;
  final String title;
  final String subtitle;
  final Function page;


  CustomList(this.title,this.subtitle,this.page,{this.assetImage,this.descriptionText});


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
              if(assetImage!=null)Image.asset(assetImage),
               ListTile(
                //leading: Icon(Icons.arrow_drop_down_circle),
                title: Text(title),
                subtitle: Text(
                  subtitle,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              if(descriptionText!=null)Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  descriptionText,
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
