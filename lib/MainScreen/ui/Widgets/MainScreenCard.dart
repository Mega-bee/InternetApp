import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../Model/wifi_model.dart';
import '../../../UserInfo/ui/Screen/UserInfo.dart';
class MainScreenCard extends StatelessWidget {
  final  WifiResponse mainScreenModel;
  final String? pass;
  final Function onCardPress;
  const MainScreenCard({ required this.mainScreenModel,required this.pass, required this.onCardPress,});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onCardPress();

      },
      child:
        Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.transparent, width: 0),
              borderRadius: BorderRadius.circular(30)),
          color:  Colors.white,
          shadowColor:  Color(0xFFea831e),
          elevation: 1,
          child: Container(
            height: MediaQuery.of(context).size.height*0.15,
            child:
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if ( mainScreenModel.status=="green") ...[
                            ListTile(

                              leading:


                              Icon(Icons.person,

                                color: Colors.green,size: 44,),



                              subtitle: Text("${mainScreenModel.phone}",
                                style: const TextStyle( fontSize: 12, color: Colors.grey),
                              ),
                              title: Text("${mainScreenModel.shortname}",
                                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
                              ),),
                          ] else if( mainScreenModel.status=="yellow")...[
                            ListTile(

                              leading:


                              Icon(Icons.person,

                                color: Colors.yellow[700],size: 44,),



                              subtitle: Text("${mainScreenModel.phone}",
                                style: const TextStyle( fontSize: 12, color: Colors.grey),
                              ),
                              title: Text("${mainScreenModel.shortname}",
                                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
                              ),),
                          ] else ...[
                            ListTile(

                              leading:


                              Icon(Icons.person,

                                color: Colors.red,size: 44,),



                              subtitle: Text("${mainScreenModel.phone}",
                                style: const TextStyle( fontSize: 12, color: Colors.grey),
                              ),
                              title: Text("${mainScreenModel.shortname}",
                                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
                              ),),
                          ],
                        ],
                      ),





                      ),

              ),
          ),
        );

  }
}
