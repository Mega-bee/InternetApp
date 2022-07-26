import 'dart:convert';

class WebParam {
  static String USERNAME = "georges02";
  static String PASSWORD = "1234";

  static String IDS = "ids";
  static String OP = "op";


  // static String PATIENTID="patientId";

  static Map<String, dynamic> LoginParams(
      String username, String pass,) {
    var map = new Map<String, String>();
    map[USERNAME] = username;
    map[PASSWORD] = pass;

    print(map);
    return map;
  }

  static Map<String, dynamic> RenewParams(
      String username,) {
    var map = new Map<String, dynamic>();
    map[OP] = 'renew';
    map[IDS] = json.encode({"username":username});
    print(map);
    return map;
  }

}
