import 'package:flutter/material.dart';
import 'package:hacker_news/pages/story/best.page.dart';
import 'package:hacker_news/pages/story/news.page.dart';
import 'package:hacker_news/pages/story/top.page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Hacker News",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),

      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: menu(context),
          body: TabBarView(
            children: [
              if(mounted) NewsPage()
              else loading(context),
              BestPage(),
              TopPage(),
            ],
          ),
        ),
      ),
    );
  }
}



Widget menu(BuildContext context) {
  return Container(
    color: Theme.of(context).primaryColor,
    child: TabBar(
      unselectedLabelColor: Colors.black,
      labelColor: Colors.white,
      tabs: [
        Tab(icon: Icon(Icons.home), text: "Home"),
        Tab(icon: Icon(Icons.star_border), text: "Best"),
        Tab(icon: Icon(Icons.whatshot), text: "Top",),
      ],
    ),
  );
}

Widget loading(BuildContext context) {
  return Container(
    child: Center(child: CircularProgressIndicator(),),
  );
}