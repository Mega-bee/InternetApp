import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:internet/LoginPage/ui/Screen/Screen.dart';
import 'package:internet/MainScreen/ui/Screen/MainScreen.dart';

import 'Hive/Hive.dart';
import 'LoginPage/ui/Screen/Screen.dart';
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await HiveSetUp.init();
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
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        splash: Center(
          child: Image.asset("assets/Images/WifiImage.jpg",),
        ),
        splashIconSize: 200,
        nextScreen: LoginPage(),
      ),
    );
  }
}