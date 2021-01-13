import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasbihView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new makeItRainState();
  }

}

class makeItRainState extends State<TasbihView> {
  int _tashbehCount = 0;

  // void counter() {
  //   setState(() {
  //     _tashbehCount = _tashbehCount + 1;
  //   });
  // }
  void refresh(){
    setState(() {
      _tashbehCount = 0;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    loadData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tasbih"),
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: new Container(
          child : new Column(
            children: <Widget>[
              new Expanded(
                  child: new Center(
                    child: new Text(_tashbehCount!=null?'$_tashbehCount':'0',
                      style: new TextStyle(
                          //color: _tashbehCount < 50 ? Colors.greenAccent: Colors.red,
                          color: Colors.greenAccent,
                          fontSize: 70.0,
                          fontWeight: FontWeight.w500
                      ),),
                  )),
              new Expanded(
                  child: new Center(
                    child: new FlatButton(color: Colors.lightGreen,
                        textColor: Theme.of(context).buttonColor,
                        onPressed: ()=>_incrementCounter().then((value) => setState(() {
                          loadData();
                        })),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),),
                      child: Icon(Icons.add, color: Colors.black,),

                        // child: new Text("Make it Rain!",
                        //   style: new TextStyle(
                        //       fontSize: 18.3,
                        //       color: Colors.black),)
                    ),
                  )),
              new Expanded(
                  child: new Center(
                    child: new FlatButton(color: Colors.lightGreen,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),),
                        textColor: Theme.of(context).buttonColor,
                        onPressed: ()=>clearData().then((value) => setState(() {loadData();})),
                        child: new Text("Refresh",
                          style: new TextStyle(
                              fontSize: 18.3,
                              color: Colors.black
                          ),)),
                  ))
            ],
          )

      ),
    );
  }
  Future<int>_incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    print('Pressed $counter times.');
    await prefs.setInt('counter', counter);
  }


  Future<int>getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('counter');
  }
  loadData()async{
    getCounter().then((value){
      setState(() {
        _tashbehCount=value;
      });
    });
  }
  Future clearData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('counter');
  }
}