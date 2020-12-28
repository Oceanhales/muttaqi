import 'package:adhan_flutter/adhan_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerTime{

  Future<DateTime> getTodayFajrTime() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    double latitude=pref.getDouble('latitude');
    double longitude=pref.getDouble('longitude');
    final adhan = AdhanFlutter.create(Coordinates(latitude, longitude), DateTime.now(),CalculationMethod.KARACHI);
    return await adhan.fajr;
  }
  Future<DateTime> getTodayDhurTime() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    double latitude=pref.getDouble('latitude');
    double longitude=pref.getDouble('longitude');
    final adhan = AdhanFlutter.create(Coordinates(latitude, longitude), DateTime.now(), CalculationMethod.KARACHI);
    return await adhan.dhuhr; 
  }

  Future<DateTime> getTodayAsrTime() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    double latitude=pref.getDouble('latitude');
    double longitude=pref.getDouble('longitude');
    final adhan = AdhanFlutter.create(Coordinates(latitude, longitude), DateTime.now(), CalculationMethod.KARACHI);
    return await adhan.asr;
  }
  Future<DateTime> getTodayMagribTime() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    double latitude=pref.getDouble('latitude');
    double longitude=pref.getDouble('longitude');
    final adhan = AdhanFlutter.create(Coordinates(latitude, longitude), DateTime.now(), CalculationMethod.KARACHI);
    return await adhan.maghrib;
  }
  Future<DateTime> getTodayEshaTime() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    double latitude=pref.getDouble('latitude');
    double longitude=pref.getDouble('longitude');
    final adhan = AdhanFlutter.create(Coordinates(latitude, longitude), DateTime.now(), CalculationMethod.KARACHI);
    return await adhan.isha;
  }

}