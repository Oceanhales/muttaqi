import 'package:flutter/material.dart';
import 'package:muttaqi/pages/bangla_hadith.dart';
import 'package:muttaqi/pages/english_hadith.dart';


class Hadith extends StatefulWidget {


  @override
  _HadithState createState() => _HadithState();
}


class _HadithState extends State<Hadith> with SingleTickerProviderStateMixin{

  TabController _tabController;
  @override
  void initState() {

    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hadith"),
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Theme.of(context).accentColor,
          indicatorWeight: 3.0,
          tabs: [
            Tab(text:'English'),
            Tab(text:'Bangla'),
            // Tab(icon: Icon(Icons.article_sharp), text: 'Learnings'),
            //Tab(text: 'English'),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        color: Theme.of(context).primaryColor,
        child: TabBarView(
          controller: _tabController,
          children: [
            EnglishHadith(),
            BanglaHadith()
          ],
        ),
      ),
    );
  }
}
