class WifiResponse {
  String? resellername;
  String? maccompany;
  String? address;
  String? region;
  String? nationality;
  String? building;
  String? phone;
  String? price;
  String? balance;
  num? systemBlocked;
  String? lastAct;
  String? status;
  String? username;
  String? shortname;
  String? servicename;
  String? expireDatetime;
  String? createdDatetime;
  num? expired;
  String? dailyquota;
  String? ip;
  String? usedTraff;
  num? percent;
  String? macaddr;

  WifiResponse({this.resellername, this.maccompany, this.address, this.region, this.nationality, this.building, this.phone, this.price, this.balance, this.systemBlocked, this.lastAct, this.status, this.username, this.shortname, this.servicename, this.expireDatetime, this.createdDatetime, this.expired, this.dailyquota, this.ip, this.usedTraff, this.percent, this.macaddr});

  WifiResponse.fromJson(Map<String, dynamic> json) {
resellername = json['resellername'];
maccompany = json['maccompany'];
address = json['address'];
region = json['region'];
nationality = json['nationality'];
building = json['building'];
phone = json['phone'];
price = json['price'];
balance = json['balance'];
systemBlocked = json['system_blocked'];
lastAct = json['last_act'];
status = json['status'];
username = json['username'];
shortname = json['shortname'];
servicename = json['servicename'];
expireDatetime = json['expire_datetime'];
createdDatetime = json['created_datetime'];
expired = json['expired'];
dailyquota = json['dailyquota'];
ip = json['ip'];
usedTraff = json['used_traff'];
percent = json['percent'];
macaddr = json['macaddr'];
}


}

