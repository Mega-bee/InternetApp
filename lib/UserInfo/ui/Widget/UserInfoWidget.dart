import 'package:flutter/material.dart';

import '../../../Model/UserInfoModel.dart';
import '../../../Model/wifi_model.dart';
class UserInfoWidget extends StatelessWidget {

  final WifiResponse userInfoModel;
  const UserInfoWidget({Key? key, required this.userInfoModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            if (userInfoModel.status=="green") ...[
              Icon(Icons.circle,color: Colors.green ,size: 20,)
            ] else if(userInfoModel.status=="yellow")...[
              Icon(Icons.circle,color: Colors.yellow[700] ,size: 17,)
            ] else ...[
              Icon(Icons.circle,color: Colors.red ,size: 17,)
            ],
            SizedBox(width: 30,)
          ],

          title:

          Row(
            children: [
              Text(userInfoModel.shortname.toString(),style: TextStyle(color: Colors.purple),


              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Text(
                "Username:   "+"${userInfoModel.username}",
                style: TextStyle(fontSize: 20),
              ),
              Divider(color:Colors.purple),
              Text(
                "Phone:   "+"${userInfoModel.phone}",
                style: TextStyle(fontSize: 20),
              ),
              Divider(color:Colors.purple),
              Text(
                "Address:  "+"${userInfoModel.address}",
                style: TextStyle(fontSize: 20),
              ),
              Divider(color:Colors.purple),
              Text(
                "Reseller Name:   "+"${userInfoModel.resellername}",
                style: TextStyle(fontSize: 20),
              ),
              Divider(color:Colors.purple),
              Text(
                "Service name:   "+"${userInfoModel.servicename}",
                style: TextStyle(fontSize: 20),
              ),
              Divider(color:Colors.purple),
              Text(
                "Price:   "+"${userInfoModel.price}",
                style: TextStyle(fontSize: 20),
              ),
              Divider(color:Colors.purple),
              Text(
                "IP address:   "+"${userInfoModel.ip}",
                style: TextStyle(fontSize: 20),
              ),
              Divider(color:Colors.purple),
              Text(
                "Expire date:   "+"${userInfoModel.expireDatetime}",
                style: TextStyle(fontSize: 20),
              ),
              Divider(color:Colors.purple),
              Text(
                "Created date:   "+"${userInfoModel.createdDatetime}",
                style: TextStyle(fontSize: 20),
              ),
              Divider(color:Colors.purple),
              Text(
                "Last Active:   "+"${userInfoModel.lastAct}",
                style: TextStyle(fontSize: 20),
              ),
              Divider(color:Colors.purple),
              Expanded(child: SizedBox.shrink()),
              Container(
                alignment: Alignment.center,
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Renew",
                        style: TextStyle(color: Colors.white,fontSize:20 ),
                      ),
                      style:  ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          alignment: Alignment.center,
                          shape:
                          //     MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(color: Colors.purple),
                          )
                      ),
                    )
                ),
              )
            ],
          ),
        ));
  }
}

