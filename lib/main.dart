import 'package:flutter/material.dart';
import 'package:newsapp/TabBar.dart';

void main() {


  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Tabbarview(),
      theme: ThemeData(
        primarySwatch: Colors.lime,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    ),
    );
}
