import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: const Color(0xFF02BB9F),
      primaryColorDark: const Color(0xFF167F67),
      accentColor: const Color(0xFF167F67),
    ),
    home: DropdownScreen(),
  ));
}

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class DropdownScreen extends StatefulWidget {
  State createState() => DropdownScreenState();
}

class DropdownScreenState extends State<DropdownScreen> {
  var data;
  Item selectedUser;
  List<Item> users = <Item>[
    const Item(
        'business',
        Icon(
          Icons.business,
          color: const Color(0xFF167F67),
        )),
    const Item(
        'education',
        Icon(
          Icons.cast_for_education,
          color: const Color(0xFF167F67),
        )),
    const Item(
        'us',
        Icon(
          Icons.location_city,
          color: const Color(0xFF167F67),
        )),
    const Item(
        'top trending',
        Icon(
          Icons.trending_down,
          color: const Color(0xFF167F67),
        )),
  ];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(
        "http://newsapi.org/v2/everything?q=apple&from=2020-11-02&to=2020-11-02&sortBy=popularity&apiKey=f2ffbfc74b5a48bdaf57e0aa7e4211cf");
    print(res.body);
    data = jsonDecode(res.body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF167F67),
          title: Text(
            'News',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Trending News",
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  DropdownButton<Item>(
                    hint: Text("Select item"),
                    value: selectedUser,
                    onChanged: (Item Value) {
                      setState(() {
                        selectedUser = Value;
                      });
                    },
                    items: users.map((Item user) {
                      return DropdownMenuItem<Item>(
                        value: user,
                        child: Row(
                          children: <Widget>[
                            user.icon,
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              user.name,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: data["articles"].length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                              
                                Image.network(data["articles"][index]["urlToImage"]),
                                //  data["articles"][index]["title"] != null?
                                // Image.network("data["articles"][index]["urlToImage"]")
                                // :Image.network("https://www.testingxperts.com/wp-content/uploads/2019/02/placeholder-img.jpg"),
                               //  Image.network("${data["articles"][index]["urlToImage"]}"),
                                // FadeInImage(
                                //   image: AssetImage(
                                //       "${data["articles"][index]["urlToImage"]}"),
                                //   fit: BoxFit.cover,
                                //   placeholder:
                                //       AssetImage("assets/images/wallfy.png"),
                                // ),

                                // Image(
                                //     width: 400,
                                //     height: 200,
                                //     image:
                                //         AssetImage("assets/images/wallfy.png")),
                                
                                Text("${data["articles"][index]["title"]}",
                                    style: new TextStyle(color: Colors.black)),
                              ],
                            ),
                          ),
                        )),
              ),
            ),
            Text("${data["articles"][0]["title"]}",
                                    style: new TextStyle(color: Colors.black)),
          ],
        )),
      ),
    );
  }
}

















// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:newsapp/customclass/item.dart';
// import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

// class HomeNews extends StatefulWidget {
//   State createState() => HomeNewsState();
// }

// class HomeNewsState extends State<HomeNews> {
  // var data;
  // Item selectedUser;

//   fetchData() async {
//     var res = await http.get(
//         "http://newsapi.org/v2/everything?q=apple&from=2020-11-02&to=2020-11-02&sortBy=popularity&apiKey=1f4a12d2698e432ea9cf18126dcc7acd");
//     print(res.body);
//     data = jsonDecode(res.body);
//     setState(() {});
//   }

//    @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(children: [
//           data != null
//               ? Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text("Trending News",
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 20)),
//                           DropdownButton<Item>(
//                             hint: Text("Select item"),
//                             value: selectedUser,
//                             onChanged: (Item Value) {
//                               setState(() {
//                                 selectedUser = Value;
//                               });
//                             },
//                             items: users.map((Item user) {
//                               return DropdownMenuItem<Item>(
//                                 value: user,
//                                 child: Row(
//                                   children: <Widget>[
//                                     user.icon,
//                                     SizedBox(
//                                       width: 10,
//                                     ),
//                                     Text(
//                                       user.name,
//                                       style: TextStyle(color: Colors.black),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: MediaQuery.of(context).size.height,
//                         child: ListView.builder(
//                             itemCount: data["articles"].length,
//                             scrollDirection: Axis.vertical,
//                             itemBuilder: (context, index) => Card(
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: <Widget>[
//                                         GestureDetector(
//                                           onTap: () => {
//                                             launch(
//                                               data["articles"][index]["url"],
//                                               option: new CustomTabsOption(
//                                                 toolbarColor: Theme.of(context)
//                                                     .primaryColor,
//                                                 enableDefaultShare: true,
//                                                 enableUrlBarHiding: true,
//                                                 showPageTitle: true,
//                                                 animation:
//                                                     new CustomTabsAnimation
//                                                         .slideIn(),
//                                                 // or user defined animation
//                                                 extraCustomTabs: <String>[
//                                                   // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
//                                                   'org.mozilla.firefox',
//                                                   // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
//                                                   'com.microsoft.emmx',
//                                                 ],
//                                               ),
//                                             )
//                                           },
//                                           child: Image.network(data["articles"]
//                                               [index]["urlToImage"]),
//                                         ),
//                                         Text(
//                                             "${data["articles"][index]["title"]}",
//                                             style: new TextStyle(
//                                                 color: Colors.black,fontSize: 20)),
//                                       ],
//                                     ),
//                                   ),
//                                 )),
//                       ),
//                     ),
//                     Text("${data["articles"][0]["title"]}",
//                         style: new TextStyle(color: Colors.black)),
//                   ],
//                 )
//               : Center(child: CircularProgressIndicator()),
//           Image(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               image: AssetImage("assets/images/wallfy.png")),
//           SizedBox(
//             width: 12,
//           ),
//           Image(
//               width: 400,
//               height: 200,
//               image: AssetImage("assets/images/wallfy.png")),
//           SizedBox(
//             width: 12,
//           ),
//           Image(
//               width: 400,
//               height: 200,
//               image: AssetImage("assets/images/wallfy.png")),
//         ]),
//       ),
//     );
//   }
// }

