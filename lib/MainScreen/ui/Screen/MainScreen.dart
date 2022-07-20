import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:internet/MainScreen/ui/Widgets/MainScreenCard.dart';
import 'package:internet/Model/UserInfoModel.dart';
import '../../../Helper/Colors/Colors.dart';
import '../Widgets/SearchWidget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<UserInfoModel> userInfoModel;
  String query = '';

  @override
  void initState() {
    super.initState();

    userInfoModel = UsersList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          // leadingWidth:MediaQuery.of(context).size.width,
          toolbarHeight: MediaQuery.of(context).size.height * 0.15,
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Column(
                  children: [
                    SafeArea(
                      child: Container(
                        color: PrimaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Users",style: TextStyle(color: Colors.white),),
                    SearchWidget(
                        text: query,
                        onChanged: searchUsers,
                        hintText: 'Search Users')
                  ],
                ))
          ])),
      body: ListView.builder(
          itemCount: userInfoModel.length,
          itemBuilder: (context, index) {
            final MainScreenModel = userInfoModel[index];
            return MainScreenCard(mainScreenModel: MainScreenModel);
          }),
    );
  }

  void searchUsers(String query) {
    final Users = UsersList.where((MainScreenModel) {
      final nameLower = MainScreenModel.name!.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.userInfoModel = Users;
    });
  }
}
