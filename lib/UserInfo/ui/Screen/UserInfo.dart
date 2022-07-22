import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../Model/UserInfoModel.dart';
import '../../../Model/wifi_model.dart';
import '../Widget/UserInfoWidget.dart';

class UserInfo extends StatelessWidget {
  final WifiResponse userInfoModel;
  final String? password;
  const UserInfo({
    Key? key, required this.userInfoModel,required this.password
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: UserInfoWidget( userInfoModel: userInfoModel,password: password,));
  }
}
