import 'dart:io';

import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:muttaqi/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

void backgroundFetchHeadlessTask(String taskId) async {

  alarmManageCall(taskId);
  BackgroundFetch.finish(taskId);

  if (taskId == 'flutter_background_fetch') {
    BackgroundFetch.scheduleTask(TaskConfig(
        taskId: "com.transistorsoft.customtask",
        delay: 5000,
        periodic: false,
        forceAlarmManager: true,
        stopOnTerminate: false,
        enableHeadless: true
    ));
  }
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
  runApp( MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
        fontFamily: 'SourceSansPro',
        primaryColor: Color(0xff1B2C57),
        accentColor: Color(0xff65D1BA)
    ),
    debugShowCheckedModeBanner: false,
    home: SplashPage(),
  ));
}
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLoading=false;
  String lat, lang;
  String currentAddress;
  getUserLocation() async {
    //call this async method from whereever you need
    SharedPreferences pref=await SharedPreferences.getInstance();
    LocationData myLocation;
    String error;
    Location location = new Location();
    setState(() {
      isLoading = true;
    });
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'please grant permission';
        print(error);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'permission denied- please enable it from app settings';
        print(error);
      }
      myLocation = null;
    }
    //var currentLocation = myLocation;
    pref.setDouble('latitude',myLocation.latitude.toDouble() );
    pref.setDouble('longitude', myLocation.longitude.toDouble());
    lat=myLocation.latitude.toString();
    lang=myLocation.longitude.toString();

    print(lat.toString());
    print(lang.toString());

    final coordinates = new Coordinates(
        myLocation.latitude,myLocation.longitude);
    var addresses = await Geocoder.google("AIzaSyAdmssGjJ5i8mJ1iylBZfPma5L0QtZoz_E").findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    currentAddress = first.addressLine;
    print(' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first
        .subAdminArea},${first.addressLine}, ${first.featureName},${first
        .thoroughfare}, ${first.subThoroughfare}');

     setState(() {
       isLoading = false;
     });

    return first;
  }
  void checkInternetConnectionAndNavigate()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        getUserLocation();
        setState(() {
          isLoading=false;
        });

      }else if(pref.getDouble('latitude')!=null && pref.getDouble('longitude')!=null){
        setState(() {
          isLoading=false;
        });
        return;
      }else{
        print('dfkdfd');

      }
    } on SocketException catch (_) {
      print('not connected');
      print(pref.getDouble('latitude'));
      if(pref.getDouble('latitude')!=null && pref.getDouble('longitude')!=null){
        setState(() {
          isLoading=false;
        });
      }else
      setState(() {
        isLoading=true;
      });
      showInSnackBar("You don't have internet connection");

    }
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value)));
  }
  @override
  void initState() {
    // TODO: implement initStat
    checkInternetConnectionAndNavigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SplashScreen(
            seconds: isLoading?120:4,
            navigateAfterSeconds:isLoading?SplashPage():Home(),
            /* title: new Text('',
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0
            ),),*/

            image: Image.asset("assets/spalc.png"),
            backgroundColor: Colors.black,
            styleTextUnderTheLoader: new TextStyle(),
            photoSize: 200.0,
            onClick: ()=>print("Flutter Egypt"),
            loaderColor: Color(0xffffbd59)

      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'SourceSansPro',
          primaryColor: Color(0xff1B2C57),
          accentColor: Color(0xff65D1BA)
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
