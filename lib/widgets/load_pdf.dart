import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class PDFViewLoadasset extends StatefulWidget {
  final String assetPdf;

  const PDFViewLoadasset({Key key, this.assetPdf}) : super(key: key);

  @override
  _PDFViewLoadassetState createState() => _PDFViewLoadassetState();
}

class _PDFViewLoadassetState extends State<PDFViewLoadasset> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    // document = await PDFDocument.fromAsset('assets/Sahih_Al-Bukhari.pdf');
    document = await PDFDocument.fromAsset(widget.assetPdf);

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          //title: const Text('FlutterPluginPDFViewer'),
        ),
        body: Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(
            document: document,
            zoomSteps: 1,
            //uncomment below line to preload all pages
            // lazyLoad: false,
            // uncomment below line to scroll vertically
            // scrollDirection: Axis.vertical,

            //uncomment below code to replace bottom navigation with your own
            /* navigationBuilder:
                      (context, page, totalPages, jumpToPage, animateToPage) {
                    return ButtonBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.first_page),
                          onPressed: () {
                            jumpToPage()(page: 0);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            animateToPage(page: page - 2);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            animateToPage(page: page);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.last_page),
                          onPressed: () {
                            jumpToPage(page: totalPages - 1);
                          },
                        ),
                      ],
                    );
                  }, */
          ),
        ),
      );
  }
}

class PDFLoadFromUrl extends StatefulWidget {
  final String urlpdf;

  const PDFLoadFromUrl({Key key, this.urlpdf}) : super(key: key);

  @override
  _PDFLoadFromUrlState createState() => _PDFLoadFromUrlState();
}

class _PDFLoadFromUrlState extends State<PDFLoadFromUrl> {

  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    // document = await PDFDocument.fromAsset('assets/Sahih_Al-Bukhari.pdf');
    document = await PDFDocument.fromURL(widget.urlpdf);

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //title: const Text('FlutterPluginPDFViewer'),
      ),
      body: Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(
          document: document,
          zoomSteps: 1,
        ),
      ),
    );
  }
}
