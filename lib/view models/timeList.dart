import 'package:adhan_flutter/adhan_flutter.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerTime{
  Future<String>getCalculation()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    return pref.getString('calculationMethod');
  }
  Future<DateTime> getTodayFajrTime() async {
    //var converter = new EnumFromString<Visibility>();
    SharedPreferences pref=await SharedPreferences.getInstance();
    String method=pref.getString('calculationMethod');
    dynamic calculation=EnumToString.fromString(CalculationMethod.values, method.toString().split('.').last);
    double latitude=pref.getDouble('latitude');
    double longitude=pref.getDouble('longitude');
    final adhan = AdhanFlutter.create(Coordinates(latitude, longitude), DateTime.now(),calculation==null?CalculationMethod.MUSLIM_WORLD_LEAGUE:calculation);
    return await adhan.fajr;
  }
  Future<DateTime> getTodayDhuhrTime() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    String method=pref.getString('calculationMethod');
    dynamic calculation=EnumToString.fromString(CalculationMethod.values, method.toString().split('.').last);
    double latitude=pref.getDouble('latitude');
    double longitude=pref.getDouble('longitude');
    final adhan = AdhanFlutter.create(Coordinates(latitude, longitude), DateTime.now(),calculation==null?CalculationMethod.MUSLIM_WORLD_LEAGUE:calculation);
    return await adhan.dhuhr; 
  }

  Future<DateTime> getTodayAsrTime() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    String method=pref.getString('calculationMethod');
    dynamic calculation=EnumToString.fromString(CalculationMethod.values, method.toString().split('.').last);
    double latitude=pref.getDouble('latitude');
    double longitude=pref.getDouble('longitude');
    final adhan = AdhanFlutter.create(Coordinates(latitude, longitude), DateTime.now(), calculation==null?CalculationMethod.MUSLIM_WORLD_LEAGUE:calculation);
    return await adhan.asr;
  }
  Future<DateTime> getTodayMaghribTime() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    String method=pref.getString('calculationMethod');
    dynamic calculation=EnumToString.fromString(CalculationMethod.values, method.toString().split('.').last);
    double latitude=pref.getDouble('latitude');
    double longitude=pref.getDouble('longitude');
    final adhan = AdhanFlutter.create(Coordinates(latitude, longitude), DateTime.now(), calculation==null?CalculationMethod.MUSLIM_WORLD_LEAGUE:calculation);
    return await adhan.maghrib;
  }
  Future<DateTime> getTodayIshaTime() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    String method=pref.getString('calculationMethod');
    dynamic calculation=EnumToString.fromString(CalculationMethod.values, method.toString().split('.').last);
    double latitude=pref.getDouble('latitude');
    double longitude=pref.getDouble('longitude');
    final adhan = AdhanFlutter.create(Coordinates(latitude, longitude), DateTime.now(),calculation==null?CalculationMethod.MUSLIM_WORLD_LEAGUE:calculation);
    return await adhan.isha;
  }

}