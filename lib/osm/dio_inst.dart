import 'package:dio/dio.dart';
import 'package:open_street_map/osm/constants/strings.dart';

Dio dio = Dio(
  BaseOptions(
    baseUrl: searchURL,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ),
);
