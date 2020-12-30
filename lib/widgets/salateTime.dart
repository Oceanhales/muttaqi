import 'dart:math';

import 'package:adhan_flutter/adhan_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';
import 'package:muttaqi/view%20models/timeList.dart';
import 'package:muttaqi/widgets/alarm_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spinner/spinner.dart';
class SalatTime extends StatefulWidget {
  @override
  _SalatTimeState createState() => _SalatTimeState();
}

class _SalatTimeState extends State<SalatTime> {

  static const int ON_SCREEN = 1;
  DateTime _dateTime = DateTime.now();
  List<String>adjustTime=['-1 minutes','0 minutes','1 minutes'];
  TimeOfDay _selectedTime;
  var prayerTime=PrayerTime();
  bool checkFajr=false;
  bool checkDhuhr=false;
  bool checkAsr=false;
  bool checkMaghrib=false;
  bool checkIsha=false;

  Future setDataToSharedPrefrence(String name,bool val)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    return await pref.setBool(name, val);
  }
  Future<bool> getStoredData(String name)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    return pref.getBool(name);
  }

  @override
  void initState() {
    // TODO: implement initState
    _selectedTime = new TimeOfDay(hour: 12, minute: 30);
    //checkFajr=pref.getBool('fajr');
    getStoredData('Fajr').then((value) => value!=null?checkFajr=value:print(value));
    getStoredData('Dhuhr').then((value) => value!=null?checkDhuhr=value:print(value));
    getStoredData('Asr').then((value) => value!=null?checkAsr=value:print(value));
    getStoredData('Maghrib').then((value) => value!=null?checkMaghrib=value:print(value));
    getStoredData('Isha').then((value) => value!=null?checkIsha=value:print(value));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: FutureBuilder(
              future: prayerTime.getTodayFajrTime(),
              builder: (context, AsyncSnapshot<DateTime> snapshot) {
                if (snapshot.hasData){
                  final dateTime = snapshot.data.toLocal();
                  return Padding(
                    padding: EdgeInsets.all(15),
                    child: ListTile(
                      //onTap: ()=>setAlarmDailog(context,DateTime.parse(dateTime.toString())),
                      title:  Text("Fajr", style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SourceSansPro'
                      ),),
                      subtitle: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(DateFormat.jm().format(dateTime).toString(), style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600
                        ),),
                      ),
                      trailing: CupertinoSwitch(
                        value:checkFajr,
                        onChanged: (bool val) {
                          setState(() {
                            checkFajr=val;
                            setDataToSharedPrefrence('Fajr',val);
                          });
                        },
                        activeColor: Color(0xff65D1BA),
                      ),
                    ),
                  );

                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: FutureBuilder(
              future:prayerTime.getTodayDhuhrTime(),
              builder: (context, AsyncSnapshot<DateTime> snapshot) {
                if (snapshot.hasData) {
                  final dateTime = snapshot.data.toLocal();
                  return Padding(
                    padding: EdgeInsets.all(15),
                    child: ListTile(
                     // onTap: ()=>setAlarmDailog(context,DateTime.parse(dateTime.toString())),
                      title:  Text("Dhuhr", style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SourceSansPro'
                      ),),
                      subtitle: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(DateFormat.jm().format(dateTime).toString(), style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600
                        ),),
                      ),
                      trailing: CupertinoSwitch(
                        value: checkDhuhr,
                        onChanged: (bool val) async{
                          setState(() {
                            checkDhuhr=val;
                            setDataToSharedPrefrence('Dhuhr',val);
                          });
                        },
                        activeColor: Color(0xff65D1BA),
                      ),
                    ),
                  );

                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: FutureBuilder(
              future: prayerTime.getTodayAsrTime(),
              builder: (context, AsyncSnapshot<DateTime> snapshot) {
                if (snapshot.hasData) {
                  final dateTime = snapshot.data.toLocal();
                  return Padding(
                    padding: EdgeInsets.all(15),
                    child: ListTile(
                      //onTap: ()=>setAlarmDailog(context,DateTime.parse(dateTime.toString())),
                      title:  Text("Asr", style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SourceSansPro'
                      ),),
                      subtitle: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(DateFormat.jm().format(dateTime).toString(), style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600
                        ),),
                      ),
                      trailing: CupertinoSwitch(
                        value: checkAsr,
                        onChanged: (bool val) {
                          setState(() {
                            checkAsr=val;
                            setDataToSharedPrefrence('Asr',val);
                          });
                        },
                        activeColor: Color(0xff65D1BA),
                      ),
                    ),
                  );

                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: FutureBuilder(
              future: prayerTime.getTodayMaghribTime(),
              builder: (context, AsyncSnapshot<DateTime> snapshot) {
                if (snapshot.hasData) {
                  final dateTime = snapshot.data.toLocal();
                  return Padding(
                    padding: EdgeInsets.all(15),
                    child: ListTile(
                      //onTap: ()=>setAlarmDailog(context,DateTime.parse(dateTime.toString())),
                        title:  Text("Magrib", style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SourceSansPro'
                        ),),
                        subtitle: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(DateFormat.jm().format(dateTime).toString(), style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600
                          ),),
                        ),
                        trailing: CupertinoSwitch(
                          value: checkMaghrib,
                          onChanged: (bool val) {
                           setState(() {
                             checkMaghrib=val;
                             setDataToSharedPrefrence('Maghrib',val);
                           });
                          },
                          activeColor: Color(0xff65D1BA),
                        ),
                    ),
                  );

                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: FutureBuilder(
              future:prayerTime.getTodayIshaTime(),
              builder: (context, AsyncSnapshot<DateTime> snapshot) {
                if (snapshot.hasData) {
                  final dateTime = snapshot.data.toLocal();
                  return Padding(
                    padding: EdgeInsets.all(15),
                    child: ListTile(
                      //onTap: ()=>setAlarmDailog(context,DateTime.parse(dateTime.toString())),
                      title:  Text("Isha", style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SourceSansPro'
                      ),),
                      subtitle: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(DateFormat.jm().format(dateTime).toString(), style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600
                        ),),
                      ),
                      trailing: CupertinoSwitch(
                        value: checkIsha,
                        onChanged: (bool val) {
                          setState(() {
                            checkIsha=val;
                            setDataToSharedPrefrence('Isha',val);
                          });
                        },
                        activeColor: Color(0xff65D1BA),
                      ),
                    ),
                  );

                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
          /*alarmItem("2:30", true,"Fazar"),
          alarmItem('2:30', false,"Ishrak"),
          alarmItem("2:30", false,"Duhr"),
          alarmItem('2:30', false,"Asr"),
          alarmItem("2:30", false,"Magrib"),
          alarmItem("2:30", false,"Auabin"),
          alarmItem("2:30", false,"Isha"),*/
        ],
      ),
    );
  }

  void setAlarmDailog(BuildContext context,DateTime dateTime){

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor:Colors.black ,
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //hourMinute12HCustomStyle(dateTime),
                    adjustDateTime(context),
                    SizedBox(height: 30,),
                    SizedBox(height: 2.0, child: Container(color: Colors.white30,),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.notifications_none, color: Colors.white,),
                            Text('Notification', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.check_box, color: Colors.white,),
                            Text('Vibrate', style: TextStyle(color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 2.0, child: Container(color: Colors.white30,),),
                    SizedBox(height: 50,),
                    SizedBox(
                      width: 320.0,
                      child: RaisedButton(
                        onPressed: ()=>Navigator.of(context).pop(),
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: const Color(0xFF1BC0C5),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked =  await showTimePicker(
        context: context,
        initialTime: _selectedTime
    );
    setState(() {
      _selectedTime = picked;
    });
  }
  Widget hourMinute12HCustomStyle(DateTime dateTime){
    return new TimePickerSpinner(
      is24HourMode: false,
      time:dateTime,
      normalTextStyle: TextStyle(
          fontSize: 24,
          color: Colors.white
      ),
      highlightedTextStyle: TextStyle(
          fontSize: 24,
          color: Colors.yellow
      ),
      spacing: 20,
      itemHeight: 40,
      isForce2Digits: true,
      minutesInterval: 1,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
  Widget adjustDateTime(BuildContext ctx){
    var height = MediaQuery.of(ctx).size.height;
    var width = MediaQuery.of(ctx).size.width;
    return Spinner(
        containerCount: adjustTime.length,
        containerSize: 100.0,
        //animationSpeed: 40,
        builder:(index){
          var color =
              (cos((2 * pi) * index /adjustTime.length ) + 1) / 2 * 255;
          return  Text(
            adjustTime[index],
            style: TextStyle(
                fontSize: 15,
                color: Colors.white),
          );
        },
        spinDirection: SpinnerDirection.down,
        duration: Duration(seconds: 5));
  }
}



