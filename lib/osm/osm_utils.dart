class OSMUtils {
  //q=hello&limit=5&format=json&addressdetails=1
  static String getSearchQuery(
    String query, {
    int limit = 10,
  }) {
    return "?format=json&addressdetails=1&limit=$limit&q=$query";
  }
}
