import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../models/location_response.dart';
import 'osm_search_delegate.dart';

class OpenMapBackground extends StatefulWidget {
  @override
  OpenMapBackgroundState createState() => OpenMapBackgroundState();
}

class OpenMapBackgroundState extends State<OpenMapBackground> {
  static const double zoom = 8;
  static const double size = 30;
  late List<Marker> markers;
  late MapController _controller;
  LocationResponse? current;

  Future<void> onSearch() async {
    LocationResponse? data = await showSearch<LocationResponse?>(
      context: context,
      delegate: OSMSearchDelegate(),
    );
    if (data == null) return;
    var point = LatLng(
      double.parse(data.lat),
      double.parse(data.lon),
    );
    setState(() {
      current = data;
      markers = [
        Marker(
          point: point,
          builder: (c) => const Icon(Icons.location_on),
        )
      ];
    });
    updateCamera(point);
  }

  void updateCamera(LatLng y) {
    _controller.move(y, zoom);
  }

  @override
  void initState() {
    super.initState();
    markers = [];
    _controller = MapController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: onSearch,
        child: const Icon(Icons.search),
      ),
      body: FlutterMap(
        mapController: _controller,
        options: MapOptions(
          center: LatLng(29.039483, 82.265723),
          zoom: zoom,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: markers,
          ),
        ],
      ),
    );
  }
}
