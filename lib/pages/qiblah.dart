import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:muttaqi/widgets/loading_indicator.dart';
import 'package:muttaqi/widgets/qiblah_compass.dart';

class Qiblah extends StatefulWidget {
  @override
  _QiblahState createState() => _QiblahState();
}

class _QiblahState extends State<Qiblah> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Qiblah"),
          elevation: 0,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingIndicator();
            if (snapshot.hasError)
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );
            else
              return
                QiblahCompass();
          },
        ),
    );
  }
}
