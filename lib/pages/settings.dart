import 'package:adhan_flutter/adhan_flutter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String calculationMethodName;
  List<String>calculationMethod=['KARACHI','DUBAI','EGYPTIAN','KUWAIT',
    'MOON_SIGHTING_COMMITTEE','MUSLIM_WORLD_LEAGUE','NORTH_AMERICA','QATAR','SINGAPORE','UMM_AL_QURA','OTHER'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text("Settings")),
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hijri Date Adjustment",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SourceSansPro'
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top :4.0,left: 8.0, right: 8.0, bottom: 16.0),
                  child: Text("0 Days",style: TextStyle(
                      color: Colors.cyanAccent,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SourceSansPro'
                  ),),
                ),
              ],
            ),
          ),


          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Prayer Calculation Method",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SourceSansPro'
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top :4.0,left: 8.0, right: 8.0, bottom: 16.0),
                  child: GestureDetector(
                    onTap: ()=>setCalculationMethod(context),
                    child: Container(
                      child: Text(calculationMethodName==null?"MUSLIM_WORLD_LEAGUE":calculationMethodName,style: TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'SourceSansPro'
                      ),),
                    ),
                  )
                ),
              ],
            ),
          ),


          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Asr Calculation Method",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SourceSansPro'
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top :4.0,left: 8.0, right: 8.0, bottom: 16.0),
                  child: Text("Shafi(Earlier Asr time)",style: TextStyle(
                      color: Colors.cyanAccent,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SourceSansPro'
                  ),),
                ),
              ],
            ),
          )

        ],
      ),




    );


  }

  void setCalculationMethod(BuildContext context){

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
                padding: const EdgeInsets.all(5.0),
                child:ListView.builder(
                  itemCount: calculationMethod.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,int index){
                    return ListTile(
                      onTap: ()async{
                        SharedPreferences pref=await SharedPreferences.getInstance();
                        pref.setString('calculationMethod','CalculationMethod.$calculationMethodName');
                        setState(() {
                          calculationMethodName=calculationMethod[index].toString();
                        });
                        Navigator.of(context).pop();
                      },
                      title: Text(calculationMethod[index].toString(),
                        style: TextStyle(color:Colors.cyanAccent,fontSize: 18,fontWeight: FontWeight.w400),),
                    );
                  },
                )
              ),
            ),
          );
        });
  }
}


