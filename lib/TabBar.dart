import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsapp/Drawer/drawer.dart';
import 'package:newsapp/screen/Cricket.dart';
import 'package:newsapp/screen/Education.dart';
import 'package:newsapp/screen/HomeNews.dart';
import 'package:newsapp/screen/Movie.dart';
import 'package:newsapp/screen/profical.dart';

class Tabbarview extends StatefulWidget {
  @override
  _TabbarviewState createState() => _TabbarviewState();
}

class _TabbarviewState extends State<Tabbarview> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
              title: Text("News"),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.hourglass_top), text: "Top News"),
                  Tab(
                      icon: Icon(Icons.cast_for_education_sharp),
                      text: "Education"),
                  Tab(icon: Icon(Icons.sports_cricket), text: "Cricket"),
                  Tab(icon: Icon(Icons.movie), text: "Movie"),
                ],
              ),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.camera_alt), onPressed: () => {}),
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: null,
                )
              ]),
          body: TabBarView(
            children: [HomeNews(), Education(), Cricket(), Movie()],
          ),
          drawer: AppDrawer(),
          bottomNavigationBar: new Container(
            color: Colors.amber,
            height: 50.0,
            // alignment: Alignment.center,
            child: new BottomAppBar(
              child: new Row(
                // alignment: MainAxisAlignment.spaceAround,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new IconButton(
                    icon: Icon(
                      Icons.home,
                    ),
                    onPressed: () {},
                  ),
                  new IconButton(
                    icon: Icon(
                      Icons.search,
                    ),
                    onPressed: null,
                  ),
                  new IconButton(
                    icon: Icon(
                      Icons.add_box,
                    ),
                    onPressed: null,
                  ),
                  new IconButton(
                    icon: Icon(
                      Icons.favorite,
                    ),
                    onPressed: null,
                  ),
                  new IconButton(
                    icon: Icon(
                      Icons.account_box,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileUI2()));
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
