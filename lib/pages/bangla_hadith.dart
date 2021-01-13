import 'package:flutter/material.dart';
import 'file:///E:/flutter/muttaqi/lib/widgets/load_html.dart';
import 'package:muttaqi/widgets/custom_list.dart';
import 'package:muttaqi/widgets/load_pdf.dart';

class BanglaHadith extends StatefulWidget {
  @override
  _BanglaHadithState createState() => _BanglaHadithState();
}

class _BanglaHadithState extends State<BanglaHadith> {
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
            CustomList("সহীহ বুখারী", "বিস্তারিত পড়ুন", ()=>BukhariBng(),)
          ],
        )
    );
  }
}
class BukhariBng extends StatefulWidget {
  @override
  _BukhariBngState createState() => _BukhariBngState();
}

class _BukhariBngState extends State<BukhariBng> {
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
            CustomList("সহীহ আল বুখারী ভলিউম ১","Read details", ()=>PDFViewLoadasset(assetPdf: 'assets/bukhari/Sahih-Bukharipart-01.pdf')),
            CustomList("সহীহ আল বুখারী ভলিউম ১","Read details", ()=>PDFViewLoadasset(assetPdf: 'assets/bukhari/Sahih-Bukharipart-01.pdf')),
            CustomList("সহীহ আল বুখারী ভলিউম ১","Read details", ()=>PDFViewLoadasset(assetPdf: 'assets/bukhari/Sahih-Bukharipart-01.pdf')),
            CustomList("সহীহ আল বুখারী ভলিউম ১","Read details", ()=>PDFViewLoadasset(assetPdf: 'assets/bukhari/Sahih-Bukharipart-01.pdf')),
            CustomList("সহীহ আল বুখারী ভলিউম ১","Read details", ()=>PDFViewLoadasset(assetPdf: 'assets/bukhari/Sahih-Bukharipart-01.pdf')),
            CustomList("সহীহ আল বুখারী ভলিউম ১","Read details", ()=>PDFViewLoadasset(assetPdf: 'assets/bukhari/Sahih-Bukharipart-01.pdf')),
            CustomList("সহীহ আল বুখারী ভলিউম ১","Read details", ()=>PDFViewLoadasset(assetPdf: 'assets/bukhari/Sahih-Bukharipart-01.pdf')),
            CustomList("সহীহ আল বুখারী ভলিউম ১","Read details", ()=>PDFViewLoadasset(assetPdf: 'assets/bukhari/Sahih-Bukharipart-01.pdf')),
            CustomList("সহীহ আল বুখারী ভলিউম ১","Read details", ()=>PDFViewLoadasset(assetPdf: 'assets/bukhari/Sahih-Bukharipart-01.pdf')),
            CustomList("সহীহ আল বুখারী ভলিউম ১","Read details", ()=>PDFViewLoadasset(assetPdf: 'assets/bukhari/Sahih-Bukharipart-01.pdf')),
            CustomList("সহীহ আল বুখারী ভলিউম ১","Read details", ()=>PDFViewLoadasset(assetPdf: 'assets/bukhari/Sahih-Bukharipart-01.pdf')),
            CustomList("সহীহ আল বুখারী ভলিউম ১","Read details", ()=>PDFViewLoadasset(assetPdf: 'assets/bukhari/Sahih-Bukharipart-01.pdf')),
            CustomList("সহীহ আল বুখারী ভলিউম ১","Read details", ()=>PDFViewLoadasset(assetPdf: 'assets/bukhari/Sahih-Bukharipart-01.pdf')),
            CustomList("সহীহ আল বুখারী ভলিউম ১","Read details", ()=>PDFViewLoadasset(assetPdf: 'assets/bukhari/Sahih-Bukharipart-01.pdf')),
            // CustomList("সহীহ আল বুখারী ভলিউম ২","Read details", ()=>PDFViewLoad(assetPdf: 'assets/bukhari/Sahih-Bukharipart-02.pdf')),
            // CustomList("সহীহ আল বুখারী ভলিউম ৩","Read details", ()=>PDFViewLoad(assetPdf: 'assets/bukhari/Sahih-Bukharipart-03.pdf')),
            // CustomList("সহীহ আল বুখারী ভলিউম ৪","Read details", ()=>PDFViewLoad(assetPdf: 'assets/bukhari/Sahih-Bukharipart-04.pdf')),
            // CustomList("সহীহ আল বুখারী ভলিউম ৫","Read details", ()=>PDFViewLoad(assetPdf: 'assets/bukhari/Sahih-Bukharipart-05.pdf')),
            // CustomList("সহীহ আল বুখারী ভলিউম ৬","Read details", ()=>PDFViewLoad(assetPdf: 'assets/bukhari/Sahih-Bukharipart-06.pdf')),
            // CustomList("সহীহ আল বুখারী ভলিউম ৭","Read details", ()=>PDFViewLoad(assetPdf: 'assets/bukhari/Sahih-Bukharipart-07.pdf')),
            // CustomList("সহীহ আল বুখারী ভলিউম ৮","Read details", ()=>PDFViewLoad(assetPdf: 'assets/bukhari/Sahih-Bukharipart-08.pdf')),
            // CustomList("সহীহ আল বুখারী ভলিউম ৯","Read details", ()=>PDFViewLoad(assetPdf: 'assets/bukhari/Sahih-Bukharipart-09.pdf')),
            // CustomList("সহীহ আল বুখারী ভলিউম ১০","Read details", ()=>PDFViewLoad(assetPdf: 'assets/bukhari/Sahih-Bukharipart-10.pdf')),

          ],
        )
    );
  }
}
