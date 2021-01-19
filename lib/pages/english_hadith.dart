import 'package:flutter/material.dart';
import 'package:muttaqi/widgets/custom_list.dart';
import 'package:muttaqi/widgets/load_pdf.dart';

class EnglishHadith extends StatefulWidget {
  @override
  _EnglishHadithState createState() => _EnglishHadithState();
}

class _EnglishHadithState extends State<EnglishHadith> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text("Knowledge"),
        //   elevation: 0,
        // ),
        backgroundColor: Theme.of(context).primaryColor,
        body: ListView(
          children: [
            CustomList("Sahi Al Bukhari","Read details", ()=>BukhariEng())
          ],
        )
    );
  }
}

class BukhariEng extends StatefulWidget {
  @override
  _BukhariEngState createState() => _BukhariEngState();
}

class _BukhariEngState extends State<BukhariEng> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sahi Al Bukhari"),
        elevation: 0,
      ),
        backgroundColor: Theme.of(context).primaryColor,
        body: ListView(
          children: [
            CustomList("Sahi Al Bukhari Volume-1","Read details", ()=>PDFLoadFromUrl(urlpdf: "https://futureislam.files.wordpress.com/2012/11/sahih-al-bukhari-volume-1-ahadith-0001-875.pdf",)),
            CustomList("Sahi Al Bukhari Volume-2","Read details", ()=>PDFLoadFromUrl(urlpdf: "https://futureislam.files.wordpress.com/2012/11/sahih-al-bukhari-volume-2-ahadith-876-1772.pdf",)),
            CustomList("Sahi Al Bukhari Volume-3","Read details", ()=>PDFLoadFromUrl(urlpdf: "https://futureislam.files.wordpress.com/2012/11/sahih-al-bukhari-volume-3-ahadith-1773-2737.pdf",)),
            CustomList("Sahi Al Bukhari Volume-4","Read details", ()=>PDFLoadFromUrl(urlpdf: "https://futureislam.files.wordpress.com/2012/11/sahih-al-bukhari-volume-4-ahadith-2738-3648.pdf",)),
            CustomList("Sahi Al Bukhari Volume-5","Read details", ()=>PDFLoadFromUrl(urlpdf: "https://futureislam.files.wordpress.com/2012/11/sahih-al-bukhari-volume-5-ahadith-3649-4473.pdf",)),
            CustomList("Sahi Al Bukhari Volume-6","Read details", ()=>PDFLoadFromUrl(urlpdf: "https://futureislam.files.wordpress.com/2012/11/sahih-al-bukhari-volume-6-ahadith-4474-5062.pdf",)),
            CustomList("Sahi Al Bukhari Volume-7","Read details", ()=>PDFLoadFromUrl(urlpdf: "https://futureislam.files.wordpress.com/2012/11/sahih-al-bukhari-volume-7-ahadith-5063-5969.pdf",)),
            CustomList("Sahi Al Bukhari Volume-8","Read details", ()=>PDFLoadFromUrl(urlpdf: "https://futureislam.files.wordpress.com/2012/11/sahih-al-bukhari-volume-8-ahadith-5970-6860.pdf",)),
            CustomList("Sahi Al Bukhari Volume-9","Read details", ()=>PDFLoadFromUrl(urlpdf: "https://futureislam.files.wordpress.com/2012/11/sahih-al-bukhari-volume-9-ahadith-6861-7563.pdf",)),
          ],
        )
    );
  }
}
