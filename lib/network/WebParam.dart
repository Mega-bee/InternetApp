class WebParam {
  static String USERNAME = "georges02";
  static String PASSWORD = "1234";

  // static String PATIENTID="patientId";

  static Map<String, dynamic> LoginParams(
      String username, String pass,) {
    var map = new Map<String, String>();
    map[USERNAME] = username;
    map[PASSWORD] = pass;

    print(map);
    return map;
  }

}
