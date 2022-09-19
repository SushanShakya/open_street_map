import 'package:flutter/material.dart';
import 'package:open_street_map/osm/models/location_response.dart';
import 'package:open_street_map/osm/repo/osm_search_repo.dart';

class OSMSearchDelegate extends SearchDelegate<LocationResponse?> {
  late OSMSearchRepo _r;

  OSMSearchDelegate() {
    _r = OSMSearchRepo();
  }

  @override
  void showResults(BuildContext context) {}

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: const Icon(Icons.search),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.chevron_left),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<LocationResponse>>(
      future: _r.search(query),
      builder: (c, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data;
          if (data == null) return Container();
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (c, i) {
              var cur = data[i];
              return ListTile(
                title: Text(cur.displayName),
              );
            },
          );
        }
        return Container();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<LocationResponse>>(
      future: _r.search(query),
      builder: (c, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data;
          if (data == null) return Container();
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (c, i) {
              var cur = data[i];
              return ListTile(
                title: Text(cur.displayName),
                onTap: () {
                  close(context, cur);
                },
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
