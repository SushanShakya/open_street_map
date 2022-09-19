import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:open_street_map/osm/models/location_response.dart';
import 'package:open_street_map/osm/views/osm_search_delegate.dart';

class OsmMapView extends StatefulWidget {
  @override
  State<OsmMapView> createState() => _OsmMapViewState();
}

class _OsmMapViewState extends State<OsmMapView> {
  late PickerMapController controller;

  LocationResponse? current;

  @override
  void initState() {
    super.initState();
    controller = PickerMapController();
  }

  Future<void> onSearch() async {
    LocationResponse? data = await showSearch<LocationResponse?>(
      context: context,
      delegate: OSMSearchDelegate(),
    );
    if (data == null) return;
    setState(() {
      current = data;
    });
    controller.goToLocation(GeoPoint(
      latitude: double.parse(data.lat),
      longitude: double.parse(data.lon),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: onSearch,
        child: const Icon(Icons.search),
      ),
      body: SafeArea(
        child: OSMFlutter(
          initZoom: 15,
          controller: controller,
          trackMyPosition: true,
          staticPoints: current != null
              ? [
                  StaticPositionGeoPoint(
                    '1',
                    const MarkerIcon(
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.black,
                      ),
                    ),
                    [
                      GeoPoint(
                        // latitude: 27.666610122436534,
                        // longitude: 85.31526387576513,
                        latitude: current!.latitude,
                        longitude: current!.longitude,
                      ),
                    ],
                  ),
                ]
              : [],
        ),
      ),
    );
  }
}
