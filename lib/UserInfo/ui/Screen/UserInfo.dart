import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../Model/UserInfoModel.dart';
import '../Widget/UserInfoWidget.dart';

class UserInfo extends StatelessWidget {
  final UserInfoModel userInfoModel;
  const UserInfo({
    Key? key, required this.userInfoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: UserInfoWidget( userInfoModel: userInfoModel,));
  }
}
