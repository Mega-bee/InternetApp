import 'dart:ui';
import 'package:CloudSP/auth/log_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../CustomDeleteDialog.dart';
import '../../../Helper/Colors/Colors.dart';
import '../../../Model/wifi_model.dart';
import '../../../network/DataLoaderBloc.dart';
import '../../../network/WebUrl.dart';
import '../Widgets/MainScreenCard.dart';
import '../Widgets/SearchWidget.dart';

class MainScreen extends StatefulWidget {
  final List <WifiResponse> wifiModel;
  final String? passw;
  final String? email;

 MainScreen({required this.wifiModel,required this.passw,required this.email});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
   List<WifiResponse> UsersList=[];

  TextEditingController _textEditingController = TextEditingController();

  String query = '';
   late DataLoaderBloc refresh;

  @override
  void initState() {
    super.initState();
    UsersList=widget.wifiModel;
    refresh = DataLoaderBloc(Loading());
    refresh.add(FetchData(Urls.GET_API,headers: {"username": widget.email ,"password":widget.passw},
        requestType: RequestType.get));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(

          backgroundColor:  Color(0xFFea831e),

          elevation: 0,
          automaticallyImplyLeading: false,
          // leadingWidth:MediaQuery.of(context).size.width,
          toolbarHeight: MediaQuery.of(context).size.height * 0.15,
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start
                  , children: [
            Column(
              children: [



                Column(
                  children: [
                    SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.05),
                      child: TextField(
                        controller: _textEditingController,
                        autofocus: false,

                        onChanged: (searchText) {
                          searchText = searchText.toLowerCase();
                          print(searchText);
                          print("search test");

                          UsersList = widget.wifiModel
                              .where(
                                (string) =>
                                (string.shortname!+ string.phone!).toLowerCase().contains(
                                  searchText.toLowerCase(),
                                ),
                          )
                              .toList();
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical:
                              MediaQuery.of(context).size.height * 0.01),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(

                                  color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: const Color.fromRGBO(18, 108, 242, 1),
                          hintText: 'Search Name',

                          prefixIcon: const Icon(
                            Icons.search_rounded,color:Colors.blue,
                          ),
                          prefixIconColor: const Color.fromRGBO(157, 157, 157, 1),
                          hintStyle: const TextStyle(
                              color: Color.fromRGBO(157, 157, 157, 1),
                              fontSize: 15,
                              fontFamily: 'Roboto-Regular'),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            )
          ])),

      floatingActionButton: ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary:   Color(0xFFea831e)
    ),

        onPressed: (){
          showDialog(context: context, builder: (context)=>
          CustomDeleteDialog(
            title: "Are you sure you want to Logout ? ",
            content: "",
            noBtn:(){ Navigator.pop(context);},
    yesBtn: (){Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    },

          ));},



        child: Text("logout"),
      ),
      body:

      BlocBuilder<DataLoaderBloc, GlobalState>(
        bloc: refresh,
    builder: (context, state) {
      if (state is Loading) {
        return Center(child: CircularProgressIndicator());
      }
      else
        return RefreshIndicator(
          onRefresh:
              () async {
            await refresh
              ..add(
                  FetchData(Urls.GET_API,
                      headers: {
                        "username": widget.email,
                        "password": widget.passw
                      },

                      requestType: RequestType.get

                  ));
          },

          child: ListView.builder(
              itemCount: UsersList.length,
              itemBuilder: (context, index) {
                final MainScreenModel = UsersList[index];
                return MainScreenCard(
                  mainScreenModel: MainScreenModel, pass: widget.passw,);
              }),
        );
    }

    )

    );
  }


}
