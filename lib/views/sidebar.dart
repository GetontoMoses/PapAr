import 'package:flutter/material.dart';

Widget Sidebar() {
  return NavigationDrawer(children: [
    ListTile(
      leading: Icon(Icons.home),
      title: Text('Home'),
      onTap: () {},
    ),
    ListTile(
      leading: Icon(Icons.search),
      title: Text('Search'),
      onTap: () {},
    ),
    ListTile(
      leading: Icon(Icons.download_rounded),
      title: Text('downloads'),
      onTap: () {},
    ),
  ]);
}
