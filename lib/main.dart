import 'package:flutter/material.dart';
import 'package:open_street_map/osm/views/osm_map_view_new.dart';

void main() => runApp(OSM());

class OSM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OSM',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: OpenMapBackground(),
    );
  }
}
