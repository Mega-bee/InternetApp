class UserInfoModel {
  String? address;
  String? username;
  String? phonenumber;
  String? name;
  String? resellername;
  String? servicename;
  String? expiredatetime;
  String? createdDatatime;
  String? ip;
  String? lastActive;

  UserInfoModel(
      {this.name,
      this.address,
      this.createdDatatime,
      this.expiredatetime,
      this.ip,
      this.phonenumber,
      this.resellername,
      this.servicename,
      this.username,
      this.lastActive});
}

List<UserInfoModel> UsersList = [
  UserInfoModel(
    address: "chris",
    name: "wkcvwcew",
    phonenumber: "1294155841"
  ),
  UserInfoModel(
    address: "peter",
    name: "wkcvwcew",
  ),
  UserInfoModel(
    address: "jad",
    name: "wkcvwcew",
  ),
  UserInfoModel(
    address: "mahfouz",
    name: "wkcvwcew",
  ),
  UserInfoModel(
    address: "hadi",
    name: "wkcvwcew",
  )
];
