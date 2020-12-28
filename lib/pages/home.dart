
import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:muttaqi/pages/learning.dart';
import 'package:muttaqi/pages/salat_rules_html.dart';
import 'package:muttaqi/view%20models/timeList.dart';
import 'package:muttaqi/widgets/salateTime.dart';
import 'package:muttaqi/widgets/waqt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}
Future <dynamic> alarmManageCall(String taskId)async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  List<String> prayerName=['Fajr','Dhuhr','Asr','Magrib','Isha'];
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
      if(value.isAtSameMomentAs(DateTime.now()) ||
          (-1<DateTime.now().difference(value).inMinutes && DateTime.now().difference(value).inMinutes<1)){
        _HomeState()._showNotification("It's Fajr Time", "Whoever prays the Fajr prayer, he or she is then under Allah’s protection. So beware, O son or daughter of Adam, that Allah does not call you to account for being absent from His protection for any reason.");
      }else{
        return;
      }
    });

  }else if(name.trim()=='Dhuhr'){
    PrayerTime().getTodayDhurTime().then((value) {
      if(value.isAtSameMomentAs(DateTime.now()) || (-1<DateTime.now().difference(value).inMinutes && DateTime.now().difference(value).inMinutes<1)){
        _HomeState()._showNotification("It's Dhuhr Time", "“Whoever observes the practice of performing four Rakat before Zuhr prayer and four (2 sunnah, 2 nafl) after the zuhr prayer, Allah will send him against the Fire (of Hell).” (Tirmidhi)");
      }else{
        return;
      }
    });
  }else if(name.trim()=='Asr'){
    print("sdjhj");
    PrayerTime().getTodayAsrTime().then((value) {
      if(value.isAtSameMomentAs(DateTime.now()) || (-1<DateTime.now().difference(value).inMinutes && DateTime.now().difference(value).inMinutes<1)){
        _HomeState()._showNotification("It's Asr Time", "“He who observes Al-Bardan (i.e. Fajr and Asr prayers) will enter Jannah.” (Bukhari)");
      }else{
        return;
      }
    });
  }else if(name.trim()=='Magrib'){
    PrayerTime().getTodayMagribTime().then((value) {
      if(value.isAtSameMomentAs(DateTime.now()) || (-1<DateTime.now().difference(value).inMinutes && DateTime.now().difference(value).inMinutes<1) ){
        _HomeState()._showNotification("It's Magrib Time", "Allah Almighty showers all His blessings and rewards on those who offer Maghrib prayer. Allah (SWT) will fulfill all your wishes and Duas. Allah Almighty will give you success in wealth and family.");
      }else{
        return;
      }
    });
  }else if(name.trim()=='Isha'){
    PrayerTime().getTodayEshaTime().then((value) {
      if(value.isAtSameMomentAs(DateTime.now()) || (-1<DateTime.now().difference(value).inMinutes && DateTime.now().difference(value).inMinutes<1)){
        _HomeState()._showNotification("It's Isha Time", "If you offer Isha prayer, Allah will reward you to worship Allah for half night. It is a great blessing for you. So, make sure to never miss the Isha prayer. Try to make more dua’s after the Isha prayer, Allah listen dua’s and will shower His blessings on you. If you offer the prayer before going to sleep, you have a more peaceful night. So, try to offer Isha prayer regularly.");
      }else{
        return;
      }
    });
  }else{
   print('No sheadul select');
  }
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{


  TabController _tabController;
  int _status = 0;
  FlutterLocalNotificationsPlugin fltrNotification=FlutterLocalNotificationsPlugin();




  Future<void>_showNotification(String title,String subtitle) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        enableVibration: true,
        playSound: true,
        sound: RawResourceAndroidNotificationSound('azan_rington'),
        ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await fltrNotification.show(
        0, '$title','$subtitle' , platformChannelSpecifics,
        payload: 'item x');
  }
  Future notificationSelected(String payload) async {
    Navigator.push(
        context,
        // Create the SelectionScreen in the next step.
        MaterialPageRoute(builder: (context) => Home()));
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
    var androidInitilize = new AndroidInitializationSettings('@mipmap/muttaqi');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings = new InitializationSettings(android: androidInitilize,iOS: iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,
        onSelectNotification: notificationSelected);

    initPlatformState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
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
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Theme.of(context).accentColor,
            indicatorWeight: 3.0,
            tabs: [
              Tab(icon: Icon(Icons.access_time), text: 'Waqt',),
              Tab(icon: Icon(Icons.alarm), text: 'Times'),
              Tab(icon: Icon(Icons.article_sharp), text: 'Learnings'),
              Tab(icon: Icon(Icons.timer), text: 'Tasbih '),
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
              Learning(),
              //WebViewLoad(),
              Icon(Icons.timer),
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