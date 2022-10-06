import 'package:flutter/material.dart';
 
class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

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

