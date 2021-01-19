import 'package:flutter/material.dart';
import 'package:muttaqi/pages/hadith.dart';
import 'package:muttaqi/pages/knowledge.dart';
import 'package:muttaqi/pages/qiblah.dart';
import 'package:muttaqi/pages/tasbih.dart';
import 'package:muttaqi/widgets/category_card.dart';




class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                svgSrc: "assets/knowledge.png",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Knowledge(),),
                  );
                },
              ),
              CategoryCard(
                title: "Tasbih",
                svgSrc: "assets/tasbih.png",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TasbihView(),),
                  );
                },
              ),
              CategoryCard(
                title: "Qibla",
                svgSrc: "assets/kiblah.png",

                press: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => Qiblah(),),
                   );
                },
              ),
              CategoryCard(
                title: "Hadith",
                svgSrc: "assets/hadith.png",
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