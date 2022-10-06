import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

class Movie extends StatefulWidget {  
  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> {
   var data;

  @override
  void initState() {
    super.initState();
    movie();
  }

  movie() async {
    var res = await http.get(
        "http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=1f4a12d2698e432ea9cf18126dcc7acd");
    print(res.body);
    data = jsonDecode(res.body);
    setState(() {});
  }

   @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          data != null
              ? Column(
                  children: [
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () => {
                                            launch(
                                              data["articles"][index]["url"],
                                              option: new CustomTabsOption(
                                                toolbarColor: Theme.of(context)
                                                    .primaryColor,
                                                enableDefaultShare: true,
                                                enableUrlBarHiding: true,
                                                showPageTitle: true,
                                                animation:
                                                    new CustomTabsAnimation
                                                        .slideIn(),
                                                // or user defined animation
                                                extraCustomTabs: <String>[
                                                  // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
                                                  'org.mozilla.firefox',
                                                  // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
                                                  'com.microsoft.emmx',
                                                ],
                                              ),
                                            )
                                          },
                                          child: Image.network(data["articles"]
                                              [index]["urlToImage"]),
                                        ),
                                        Text(
                                            "${data["articles"][index]["title"]}",
                                            style: new TextStyle(
                                              color: Colors.black,
                                              fontSize: 17.5,
                                              fontWeight: FontWeight.w500,
                                            )),
                                        Text(
                                            "${data["articles"][index]["publishedAt"]}",
                                            style: new TextStyle(
                                                color: Colors.black,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                )),
                      ),
                    ),
                    Text("${data["articles"][0]["title"]}",
                        style: new TextStyle(color: Colors.black)),
                  ],
                )
              : Center(child: CircularProgressIndicator()),
        ]),
      ),
    );
  }
}
