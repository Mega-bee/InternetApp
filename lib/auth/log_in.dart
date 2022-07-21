import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hive/hive.dart';
import 'package:motion_toast/motion_toast.dart';
import '../Hive/Hive.dart';
import '../MainScreen/ui/Screen/MainScreen.dart';
import '../Model/wifi_model.dart';
import '../network/DataLoaderBloc.dart';
import '../network/WebParam.dart';
import '../network/WebUrl.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  ///hive
  List <WifiResponse> wifiresp=[];
  late Box<String> saveToken;

  final email = TextEditingController();

  final password = TextEditingController();

  String validatePass(value) {
    if (value.isEmpty) {
      return 'Required *';
    }
    return "";
  }

  bool _isObscure = true;

  void initState() {
    // TODO: implement initState
    super.initState();
  }

  AuthPrefsHelper authPrefsHelper = AuthPrefsHelper();

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (BuildContext context) => DataLoaderBloc(Default()),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: mediaQueryHeight * 0.35,
                  width: mediaQueryWidth,
                  child: Stack(children: [
                    SizedBox(
                        width: mediaQueryWidth,
                        height: 400,
                        child: Image.asset(
                            'assets/Images/int.jpeg',

                            fit: BoxFit.cover)),
                    ColoredBox(
                      color: const Color.fromRGBO(255, 255, 255, 0.9),
                      child: SizedBox(
                        width: mediaQueryWidth,
                        height: mediaQueryHeight * 0.4,
                      ),
                    ),
                    Container(
                      height: mediaQueryHeight * 0.62,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Welcome To ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto-Bold'),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: const Text(
                                  " Cloud Sp",
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto-Regular'),
                                ),
                              ),
                              // Container(
                              //   child: const Text(
                              //     " Health analytics",
                              //     style: TextStyle(
                              //         color: Colors.black,
                              //         fontSize: 25,
                              //         fontFamily: 'Roboto-Regular'),
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                // Padding(
                //   padding: EdgeInsets.only(
                //       top:mediaQueryHeight * 0.03,
                //       bottom: mediaQueryHeight * 0.02,
                //       left: mediaQueryWidth * 0.05),
                //   child: Row(
                //     children: const [
                //       // Text(
                //       //   "Email address",
                //       //   style: TextStyle(
                //       //       color: Colors.black,
                //       //       fontSize: 17,
                //       //       fontWeight: FontWeight.bold,
                //       //       fontFamily: 'Roboto-Medium'),
                //       // ),
                //     ],
                //   ),
                // ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: mediaQueryWidth * 0.05),
                        child: TextFormField(
                            cursorColor: Colors.purple,
                            style: const TextStyle(fontSize: 20),
                            controller: email,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: " Username",
                              focusColor: Colors.purple,
                              hoverColor: Colors.purple,
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.black12)),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            // validator: MultiValidator([
                            //   RequiredValidator(errorText: 'Required *'),
                            //   EmailValidator(errorText: 'Not a valid email'),
                            // ]),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.emailAddress),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: mediaQueryWidth * 0.05),
                        child: TextFormField(
                          cursorColor: Colors.purple,
                          style: const TextStyle(fontSize: 20),
                          obscureText: _isObscure,
                          controller: password,
                          // autovalidateMode:
                          //     AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                            hintText: " Password",
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.black12,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: validatePass,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),

                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(
                //       top: mediaQueryHeight * 0.03,
                //       bottom: mediaQueryHeight * 0.02,
                //       left: mediaQueryWidth * 0.05),
                //   child: Row(
                //     children: const [
                //       // Text(
                //       //   "Password",
                //       //   style: TextStyle(
                //       //       color: Colors.black,
                //       //       fontWeight: FontWeight.bold,
                //       //       fontSize: 17,
                //       //       fontFamily: 'Roboto-Medium'),
                //       // ),
                //     ],
                //   ),
                // ),

                BlocConsumer<DataLoaderBloc, GlobalState>(
                  listener: (context, state) {
                    if (state is Error) {
                      Fluttertoast.showToast(msg: state.errorMessage);
                    } else if (state is ConnectionError) {
                      MotionToast.error(
                              title: Text("Wifi",

                                 style: TextStyle(fontWeight: FontWeight.bold),),
                              description: Text("Connection error")
                              //  animationType: ANIMATION.FROM_LEFT,
                              )
                          .show(context);
                    } else if (state is Successfully) {
                      print(state.data);
                      for(var item in state.data ){
                        wifiresp.add(WifiResponse.fromJson(item));
                      }
                      // WifiResponse login = WifiResponse.fromJson(state.data);
                      print('-------------------------------------------');


                      //store token inside sharedPref
                      //  login.gettoken;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return MainScreen(wifiModel: wifiresp,);
                          },
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is Default) {
                      print("default");
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: mediaQueryHeight * 0.03,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (password.text.isEmpty ||
                                email.text.isEmpty ||
                                password.text.length < 3) {
                              _formKey.currentState!.validate();
                            }
                            // Fluttertoast.showToast(
                            //     msg: getTranslate(context, 'fillField'),
                            //     toastLength: Toast.LENGTH_SHORT,
                            //     gravity: ToastGravity.BOTTOM,
                            //     timeInSecForIosWeb: 1);
                            else {
                              String tokenIre = '';
                                BlocProvider.of<DataLoaderBloc>(context).add(
                                    FetchData(Urls.GET_API,
                                        requestType: RequestType.get));

                            }
                          },
//                             } Navigator.of(context).pushReplacement(MaterialPageRoute(
//                                  builder: (context) =>  Navigationbar()));

                          child: const Text(
                            'Log In',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto-Bold'),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: mediaQueryWidth * 0.35,
                                vertical: mediaQueryHeight * 0.025),
                            primary: Colors.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                      );
                    } else if (state is Loading)
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: mediaQueryHeight * 0.03,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
//                              Navigator.of(context).pushReplacement(MaterialPageRoute(
//                                  builder: (context) =>  Navigationbar()));
                          },
                          child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white)),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: mediaQueryWidth * 0.35,
                                vertical: mediaQueryHeight * 0.025),
                            primary: const Color.fromRGBO(205, 8, 27, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                      );
                    else {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: mediaQueryHeight * 0.03,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (password.text.isEmpty ||
                                email.text.isEmpty ||
                                password.text.length < 6) {
                              _formKey.currentState!.validate();
                            }
                            // Fluttertoast.showToast(
                            //     msg: getTranslate(context, 'fillField'),
                            //     toastLength: Toast.LENGTH_SHORT,
                            //     gravity: ToastGravity.BOTTOM,
                            //     timeInSecForIosWeb: 1);
                            else {
                              BlocProvider.of<DataLoaderBloc>(context).add(
                                  FetchData(Urls.GET_API,
                                      body: WebParam.LoginParams(
                                          email.text, password.text, ""),
                                      requestType: RequestType.post));
                            }
                          },
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto-Bold'),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: mediaQueryWidth * 0.35,
                                vertical: mediaQueryHeight * 0.025),
                            primary: const Color.fromRGBO(205, 8, 27, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
