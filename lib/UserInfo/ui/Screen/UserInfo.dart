import 'dart:ui';

import 'package:CloudSP/network/DataLoaderBloc.dart';
import 'package:CloudSP/network/WebParam.dart';
import 'package:CloudSP/network/WebUrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../../Model/wifi_model.dart';

class UserInfo extends StatelessWidget {
  final WifiResponse userInfoModel;
  final String? password;
  const UserInfo(
      {Key? key, required this.userInfoModel, required this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            if (userInfoModel.status == "green") ...[
              Icon(
                Icons.circle,
                color: Colors.green,
                size: 20,
              )
            ] else if (userInfoModel.status == "yellow") ...[
              Icon(
                Icons.circle,
                color: Colors.yellow[400],
                size: 17,
              )
            ] else ...[
              Icon(
                Icons.circle,
                color: Colors.red,
                size: 17,
              )
            ],
            SizedBox(
              width: 30,
            )
          ],
          title: Row(
            children: [
              Text(
                userInfoModel.shortname.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Color(0xFFea831e),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (BuildContext context) => DataLoaderBloc(Default()),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
                RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                          text: "Username        :  ",
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(text: "${userInfoModel.username}"),
                    ],
                  ),
                ),
                Divider(color: Colors.blue),
                RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                          text: "Phone                :  ",
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(text: "${userInfoModel.phone}"),
                    ],
                  ),
                ),
                Divider(color: Colors.blue),
                RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                          text: "Address            :  ",
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(text: "${userInfoModel.address}"),
                    ],
                  ),
                ),
                Divider(color: Colors.blue),
                RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                          text: "Service Name :  ",
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(text: "${userInfoModel.servicename}"),
                    ],
                  ),
                ),
                Divider(color: Colors.blue),
                RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                          text: "IP Adress          :  ",
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(text: "${userInfoModel.ip}"),
                    ],
                  ),
                ),
                Divider(color: Colors.blue),
                RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                          text: "Created Date   :  ",
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(text: "${userInfoModel.createdDatetime}"),
                    ],
                  ),
                ),
                Divider(color: Colors.blue),
                RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                          text: "Expire Date      :  ",
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(text: "${userInfoModel.expireDatetime}"),
                    ],
                  ),
                ),
                Divider(color: Colors.blue),
                RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                          text: "Used Traff        :  ",
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(text: "${userInfoModel.usedTraff}"),
                    ],
                  ),
                ),
                Divider(color: Colors.blue),
                RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                          text: "Daily Quota      :  ",
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(text: "${userInfoModel.dailyquota}"),
                    ],
                  ),
                ),
                Divider(color: Colors.blue),
                RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                          text: "Percent             :  ",
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(text: "${userInfoModel.percent}"),
                    ],
                  ),
                ),
                Divider(color: Colors.blue),
                RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                          text: "Last Active      :  ",
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                      new TextSpan(text: "${userInfoModel.lastAct}"),
                    ],
                  ),
                ),
                Divider(color: Colors.blue),
                Expanded(child: SizedBox.shrink()),
                BlocConsumer<DataLoaderBloc, GlobalState>(
                  listener: (context, state) {
                    if (state is Error) {
                      Fluttertoast.showToast(
                          msg: state.errorMessage,
                          backgroundColor: Colors.white,
                          textColor: Colors.blue);
                    } else if (state is ConnectionError) {
                      MotionToast.error(
                              title: Text(
                                "Wifi",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              description: Text("Connection error")
                              //  animationType: ANIMATION.FROM_LEFT,
                              )
                          .show(context);
                    } else if (state is Successfully) {
                      Navigator.pop(context,true);
                      Fluttertoast.showToast(
                          msg: "Renew Successfully",
                          backgroundColor: Colors.white,
                          textColor: Colors.blue);
                      print(state.data);
                    }
                  },
                  builder: (context, state) {
                    if (state is Default) {
                      print("default");
                      return Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: ElevatedButton(
                              onPressed: () {
//
                                BlocProvider.of<DataLoaderBloc>(context).add(
                                    FetchData(Urls.POST_API,
                                        headers: {
                                          "username":
                                              userInfoModel.resellername,
                                          "password": password
                                        },
                                        body: WebParam.RenewParams(
                                            userInfoModel.username ?? ''),
                                        requestType: RequestType.post));
                              },
                              child: const Text(
                                "Renew",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFea831e),
                                  alignment: Alignment.center,
                                  shape:
                                      //     MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: const BorderSide(
                                        color: Color(0xFFea831e)),
                                  )),
                            )),
                      );
                    } else if (state is Loading)
                      return Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: LoadingAnimationWidget.beat(
                                color: Colors.white,
                                size: 30,
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFea831e),
                                  alignment: Alignment.center,
                                  shape:
                                      //     MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: const BorderSide(
                                        color: Color(0xFFea831e)),
                                  )),
                            )),
                      );
                    else {
                      return Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<DataLoaderBloc>(context).add(
                                    FetchData(Urls.POST_API,
                                        body: WebParam.RenewParams(
                                            userInfoModel.username ?? ''),
                                        headers: {
                                          "username":
                                              userInfoModel.resellername,
                                          "password": password
                                        },
                                        requestType: RequestType.post));
                              },
                              child: const Text(
                                "Renew",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFea831e),
                                  alignment: Alignment.center,
                                  shape:
                                      //     MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: const BorderSide(color: Colors.blue),
                                  )),
                            )),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ));
  }
}
