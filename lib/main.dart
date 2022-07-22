import 'dart:io';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'Hive/Hive.dart';
import 'auth/log_in.dart';
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await HiveSetUp.init();
  HttpOverrides.global = MyHttpOverrides();
  runApp( const MyApp());

}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFFea831e),),

      debugShowCheckedModeBanner: false,

      home: AnimatedSplashScreen(
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
        splash: Center(
          child: Image.asset("assets/Images/CLoud SP - Blank Background.png",fit: BoxFit.cover,height: 600,width: 300,),
        ),
        splashIconSize: 200,

        nextScreen: LoginScreen(),
      ),
    );
  }

}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
