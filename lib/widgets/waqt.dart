import 'dart:async';
import 'package:adhan_flutter/adhan_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:intl/intl.dart';
import 'package:muttaqi/pages/settings.dart';
import 'package:muttaqi/pages/shapes_painter.dart';
import 'package:muttaqi/view%20models/timeList.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Waqt extends StatefulWidget {

  @override
  _WaqtState createState() => _WaqtState();
}

class _WaqtState extends State<Waqt> {
  String _timeString;
  double fajar,dhuhr,asr,maghrib,isha;
  String currentPrayer;
  int endTime=0;


  @override
  void initState() {
    super.initState();
    var prayerTime=PrayerTime();
    prayerTime.getTodayFajrTime().then((value) {
      //print(value.microsecondsSinceEpoch);
      setState(() {
        fajar=(value.microsecondsSinceEpoch +1000*60)/1000;
      });
      print(fajar);
    });
    prayerTime.getTodayDhuhrTime().then((value) {
      setState(() {
        dhuhr=(value.microsecondsSinceEpoch +1000*60)/1000;
      });
    });
    prayerTime.getTodayAsrTime().then((value) {
      print(value.toString());
      setState(() {
        asr=(value.microsecondsSinceEpoch +1000*60)/1000;
      });
    });
    prayerTime.getTodayMaghribTime().then((value) {

      setState(() {
        maghrib=(value.microsecondsSinceEpoch +1000*60)/1000;
      });
    });
    prayerTime.getTodayIshaTime().then((value) {
      setState(() {
        isha=(value.microsecondsSinceEpoch +1000*60)/1000;
      });
    });
    getCurrentPrayer().then((value){
      setState(() {
        currentPrayer=value.toString().split(".")[1];
      });
    });
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    //print(DateTime.now().millisecondsSinceEpoch + 1000 * 60);
    //getCounterEndTime();

  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    if(mounted){
      setState(() {
        _timeString = formattedDateTime;
      });
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm').format(dateTime);
  }


  @override
  Widget build(BuildContext context) {
    if(currentPrayer=='FAJR'){
      setState(() {
        endTime=dhuhr.toInt();
      });
    }else if(currentPrayer=='DHUHR'){
      setState(() {
        endTime=asr.toInt();
      });
    }else if(currentPrayer=='ASR'){
      setState(() {
        endTime=maghrib.toInt();
       // print(endTime);
      });
    }else if(currentPrayer=='MAGHRIB'){
      setState(() {
        endTime=isha.toInt();
      });
    }else if(currentPrayer=='ISHA'){
      setState(() {
        endTime=fajar.toInt();
      });
    }else{
      endTime=0;
    }
    return  Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: IconButton(
              icon: Icon(Icons.settings,color: Colors.white,size: 30,),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2.0),
            child: CustomPaint(
              painter: ShapesPainter(),
              child: Container(height: MediaQuery.of(context).size.height*.4,),
            ),
          ),
          Text(_timeString.toString(), style: TextStyle(
              color: Colors.white,
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'SourceSansPro'
          ),),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Column(
          //       children: [
          //         IconButton(
          //           icon: Icon(Icons.alarm_off_outlined,color: Colors.white,size: 30,),
          //           onPressed: (){
          //             print("alarm set");
          //             // Wanted to change the icon if onpressed to Icons.alarm_off_outlined
          //           },
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.all(1.0),
          //           child: Text("Sehri",style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 18.0,
          //               fontWeight: FontWeight.bold,
          //               fontFamily: 'SourceSansPro'
          //           ),),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.all(3.0),
          //           child: Text("5:11 AM",style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 18.0,
          //               fontWeight: FontWeight.bold,
          //               fontFamily: 'SourceSansPro'
          //           ),),
          //         ),
          //       ],
          //     ),
          //     Text(_timeString.toString(), style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 50.0,
          //         fontWeight: FontWeight.bold,
          //         fontFamily: 'SourceSansPro'
          //     ),),
          //     Column(
          //       children: [
          //         IconButton(
          //           icon: Icon(Icons.alarm,color: Colors.white,size: 30,),
          //           onPressed: (){
          //             print("alarm set");
          //           },
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.all(1.0),
          //           child: Text("Ifter",style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 18.0,
          //               fontWeight: FontWeight.bold,
          //               fontFamily: 'SourceSansPro'
          //           ),),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.all(3.0),
          //           child: Text("5:13 PM",style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 18.0,
          //               fontWeight: FontWeight.bold,
          //               fontFamily: 'SourceSansPro'
          //           ),),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Current Waqt", style: TextStyle(
                color: Colors.green,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'SourceSansPro'
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: FutureBuilder(
              future: getCurrentPrayer(),
              builder: (context, AsyncSnapshot<Prayer> snapshot) {
                if (snapshot.hasData) {
                  final prayer = snapshot.data;
                  return Text(prayer.toString().split(".")[1], style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceSansPro'
                  ),);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return Text('Waiting...');
                }
              },
            ),
          ),
          CountdownTimer(
            endTime:endTime,
            widgetBuilder: (_, CurrentRemainingTime time) {
              if(time == null) {
                return Text('');
              }
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    time.days!=null?Text(" ${time.days} Days", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SourceSansPro'
                    ),):Text(''),
                    time.hours!=null?Text(" ${time.hours} Hour", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SourceSansPro'
                    ),):Text(''),
                    time.min!=null?Text(" ${time.min} Minutes", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SourceSansPro'
                    ),):Text(""),
                    Text(" ${time.sec} Seconds", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SourceSansPro'
                    ),),
                  ],
                ),
              );


            },
          ),

          /* Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("1 hour 38 minute 17 seconds remaining", style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'SourceSansPro'
            ),),
          ),*/

        ],
      ),
    );
  }
  Future<Prayer> getCurrentPrayer() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    double latitude=pref.getDouble('latitude');
    double longitude=pref.getDouble('longitude');
    final adhan = AdhanFlutter.create(Coordinates(latitude, longitude), DateTime.now(), CalculationMethod.MUSLIM_WORLD_LEAGUE);
    return await adhan.currentPrayer();
  }
}