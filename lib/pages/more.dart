import 'package:flutter/material.dart';
import 'package:muttaqi/pages/hadith.dart';
import 'package:muttaqi/pages/knowledge';
import 'package:muttaqi/pages/tasbih.dart';
import 'package:muttaqi/widgets/category_card.dart';




class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      // bottomNavigationBar: BottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: GridView.count(

            crossAxisCount: 2,
            childAspectRatio: .85,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: <Widget>[
              CategoryCard(
                title: "Knowledge",
                svgSrc: "assets/spalc.png",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Knowledge(),),
                  );
                },
              ),
              CategoryCard(
                title: "Tasbih",
                svgSrc: "assets/spalc.png",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TasbihView(),),
                  );
                },
              ),
              CategoryCard(
                title: "Kiblah",
                svgSrc: "assets/spalc.png",

                press: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => EmployeeTabControler(),),
                  // );
                },
              ),
              CategoryCard(
                title: "Hadith",
                svgSrc: "assets/spalc.png",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Hadith(),),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}