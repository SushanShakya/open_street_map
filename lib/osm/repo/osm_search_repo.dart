import 'package:open_street_map/osm/models/location_response.dart';

import '../dio_inst.dart';
import '../osm_utils.dart';

class OSMSearchRepo {
  Future<List<LocationResponse>> search(String query) async {
    var res = await dio.get(OSMUtils.getSearchQuery(query));
    return List<LocationResponse>.from(
      res.data.map((e) => LocationResponse.fromJson(e)),
    );
  }
}
