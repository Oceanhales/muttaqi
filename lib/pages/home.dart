import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:muttaqi/pages/more.dart';
import 'package:muttaqi/view%20models/timeList.dart';
import 'package:muttaqi/widgets/salateTime.dart';
import 'package:muttaqi/widgets/waqt.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

Future<void> _configureLocalTimeZone() async {
  tz.initializeTimeZones();
  //final String timeZoneName = await platform.invokeMethod('getTimeZoneName');
  final String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(currentTimeZone));
}

Future <dynamic> alarmManageCall(String taskId)async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  List<String> prayerName=['Fajr','Dhuhr','Asr','Maghrib','Isha'];
  for(int i=0;i<prayerName.length;i++){
    print(prayerName[i]);
    bool checkSetAlarm=prefs.getBool(prayerName[i]);
    if(checkSetAlarm!=null && checkSetAlarm==true){
      print('ok next');
      getTimeWaqt(prayerName[i]);
    }else{
      print('false');
    }
  }
  if (taskId == 'flutter_background_fetch') {
    BackgroundFetch.scheduleTask(TaskConfig(
        taskId: "com.transistorsoft.customtask",
        delay: 5000,
        periodic: true,
        forceAlarmManager: true,
        stopOnTerminate: false,
        enableHeadless: true
    ));
  }

  BackgroundFetch.finish(taskId);

}
void getTimeWaqt(String name){
  if(name.trim()=='Fajr'){
    PrayerTime().getTodayFajrTime().then((value) {
      //print(value);
     /* if(value.isAtSameMomentAs(DateTime.now())
          //|| (-1<DateTime.now().difference(value).inMinutes && DateTime.now().difference(value).inMinutes<1)
      ){
        _HomeState()._showNotification("It's Fajr Time", "Whoever prays the Fajr prayer, he or she is then under Allah’s protection. So beware, O son or daughter of Adam, that Allah does not call you to account for being absent from His protection for any reason.");
      }else{
        return;
      }*/
      if(value.isAfter(tz.TZDateTime.now(tz.local))){
        _HomeState()._scheduleDailyTenAMNotification(value, "It's Fajr Time", "Whoever prays the Fajr prayer, he or she is then under Allah’s protection. So beware, O son or daughter of Adam, that Allah does not call you to account for being absent from His protection for any reason.",1);

      }else{return;}
    });

  }else if(name.trim()=='Dhuhr'){
    PrayerTime().getTodayDhuhrTime().then((value) {
      if(value.isAfter(tz.TZDateTime.now(tz.local))) {
        _HomeState()._scheduleDailyTenAMNotification(value, "It's Dhuhr Time",
            "“Whoever observes the practice of performing four Rakat before Zuhr prayer and four (2 sunnah, 2 nafl) after the zuhr prayer, Allah will send him against the Fire (of Hell).” (Tirmidhi)",
            2);
      }else{return;}
    });
  }else if(name.trim()=='Asr'){
    PrayerTime().getTodayAsrTime().then((value) {
      if(value.isAfter(tz.TZDateTime.now(tz.local))) {
        _HomeState()._scheduleDailyTenAMNotification(value, "It's Asr Time",
            "“He who observes Al-Bardan (i.e. Fajr and Asr prayers) will enter Jannah.” (Bukhari)",
            3);
      }else{return;}
    });
  }else if(name.trim()=='Maghrib'){
    PrayerTime().getTodayMaghribTime().then((value) {
      if(value.isAfter(tz.TZDateTime.now(tz.local))) {
        _HomeState()._scheduleDailyTenAMNotification(value, "It's Magrib Time",
            "Allah Almighty showers all His blessings and rewards on those who offer Maghrib prayer. Allah (SWT) will fulfill all your wishes and Duas. Allah Almighty will give you success in wealth and family.",
            4);
      }else{return;}
    });
  }else if(name.trim()=='Isha'){
    PrayerTime().getTodayIshaTime().then((value) {
      if(value.isAfter(tz.TZDateTime.now(tz.local))) {
        _HomeState()._scheduleDailyTenAMNotification(value, "It's Isha Time",
            "If you offer Isha prayer, Allah will reward you to worship Allah for half night. It is a great blessing for you. So, make sure to never miss the Isha prayer. Try to make more dua’s after the Isha prayer, Allah listen dua’s and will shower His blessings on you. If you offer the prayer before going to sleep, you have a more peaceful night. So, try to offer Isha prayer regularly.",
            5);
      }else{return;}
    });
  }else{
   print('No sheadul select');
  }
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{


  TabController _tabController;
  int _status = 0;
  FlutterLocalNotificationsPlugin fltrNotification=FlutterLocalNotificationsPlugin();




  // Future<void>_showNotification(String title,String subtitle) async {
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //   AndroidNotificationDetails(
  //       'your channel id', 'your channel name', 'your channel description',
  //       importance: Importance.max,
  //       priority: Priority.high,
  //       enableVibration: true,
  //       playSound: true,
  //       sound: RawResourceAndroidNotificationSound('azan_rington'),
  //       ticker: 'ticker');
  //   const NotificationDetails platformChannelSpecifics =
  //   NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await fltrNotification.show(
  //       0, '$title','$subtitle' , platformChannelSpecifics,
  //       payload: 'item x');
  // }

  Future<void> _scheduleDailyTenAMNotification(DateTime dateTime,String title,String subtitle,int id) async {
    await fltrNotification.zonedSchedule(
        id,
        '$title',
        '$subtitle',
        _nextInstanceOfTenAM(dateTime),
        const NotificationDetails(
          android: AndroidNotificationDetails(
              'daily notification channel id',
              'daily notification channel name',
              'daily notification description',
              importance: Importance.max,
              priority: Priority.high,
              enableVibration: true,
              playSound: true,
              sound: RawResourceAndroidNotificationSound('azan_rington'),
              ticker: 'ticker'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time
    );
  }


  tz.TZDateTime _nextInstanceOfTenAM(DateTime dateTime) {
    final tz.TZDateTime now = tz.TZDateTime.from(dateTime,tz.local);
    print(now);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,now.hour,now.minute,now.second);
    //tz.TZDateTime scheduledDate = tz.TZDateTime.now(tz.local).add(const Duration(seconds: 60));
    //tz.TZDateTime(tz.local, now.year, now.month, now.day,16,22);

    // if (scheduledDate.isAfter(now)) {
    //   print("schedule time is over");
    //   // scheduledDate = scheduledDate.add(Duration(days: 1));
    // }

      return scheduledDate;
  }

  Future notificationSelected(String payload) async {
    // await Navigator.of(
    //     context).push(
    //     // Create the SelectionScreen in the next step.
    //     MaterialPageRoute(builder: (context) => Home()));
  }
  Future<void> initPlatformState() async {

    // Configure BackgroundFetch.
    BackgroundFetch.configure(
        BackgroundFetchConfig(
          minimumFetchInterval: 15,
          forceAlarmManager: false,
          stopOnTerminate: false,
          startOnBoot: true,
          enableHeadless: true,
          requiresBatteryNotLow: false,
          requiresCharging: false,
          requiresStorageNotLow: false,
          requiresDeviceIdle: false,
          requiredNetworkType: NetworkType.ANY,),
        alarmManageCall)
        .then((int status) {
      print("Hey Pawan Background fetch is successful");
      print('[BackgroundFetch] SUCCESS: $status');
      setState(() {
        _status = status;
      });
    }).catchError((e) {
      print('[BackgroundFetch] ERROR: $e');
      setState(() {
        _status = e;
      });
    });
    BackgroundFetch.scheduleTask(TaskConfig(
        taskId: "com.transistorsoft.customtask",
        delay: 10000,
        periodic: false,
        forceAlarmManager: true,
        stopOnTerminate: false,
        enableHeadless: true
    ));
    // Optionally query the current BackgroundFetch status.
    int status = await BackgroundFetch.status;
    setState(() {
      _status = status;
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  void initState() {
    super.initState();
    _configureLocalTimeZone();
    var androidInitilize = new AndroidInitializationSettings('@mipmap/muttaqi');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings = new InitializationSettings(android: androidInitilize,iOS: iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(
        initilizationsSettings,
        onSelectNotification: notificationSelected);

    initPlatformState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);

  }


  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Theme.of(context).accentColor,
            indicatorWeight: 3.0,
            tabs: [
              Tab(icon: Icon(Icons.access_time), text: 'Waqt',),
              Tab(icon: Icon(Icons.alarm), text: 'Prayer Times'),
             // Tab(icon: Icon(Icons.article_sharp), text: 'Learnings'),
              Tab(icon: Icon(Icons.apps), text: 'More '),
            ],
          ),
        ),
        body: Container(
          color: Theme.of(context).primaryColor,
          child: TabBarView(
            controller: _tabController,
            children: [
              Waqt(),
              SalatTime(),
             // Learning(),
              MoreScreen()
            ],
          ),
        ),

      ),
    );
  }

  Widget _bottomButtons() {
    return _tabController.index == 1
        ?FloatingActionButton(
      onPressed: () => Navigator.pushNamed(
          context,
          '/add-alarm'
      ),
      backgroundColor: Color(0xff65D1BA),
      child: Icon(
        Icons.add,
        size: 20.0,
      ),
    )
        :null;
  }
}