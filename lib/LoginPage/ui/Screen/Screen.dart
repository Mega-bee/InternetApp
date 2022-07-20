import 'package:flutter/material.dart';
import 'package:internet/MainScreen/ui/Screen/MainScreen.dart';
import '../Widgets/EmailTextField.dart';
import '../Widgets/PasswordTextField.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String EmailState = "";
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(children: [
                  Container(
                    child:  Image.asset(
                        "assets/Images/WifiImage2.png",
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.3,
                        fit: BoxFit.cover,

                    ),
                  ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text("Email address",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                            textAlign: TextAlign.left),
                      ],
                    ),
                    EmailTextField(controller : emailController),
                    Container(
                        alignment: Alignment.topLeft,
                        height: 20,
                        child: Text(
                          "${EmailState}",
                          style: TextStyle(color: Colors.redAccent),
                          textAlign: TextAlign.left,)
                    ),
                    Row(
                      children: const [
                        Text("Password",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                            textAlign: TextAlign.left),
                      ],
                    ),
                    const PasswordTextField(),
                    const SizedBox(height: 50),
                    LoginButton(context)
                  ],
                ),
              ),
            ]),
          ),
        )
    );
  }
  Widget LoginButton(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        onPressed: () {
          final form = formKey.currentState;
          if (form!.validate()) {
            final email=emailController.text;
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MainScreen();
                  },
                ));
          }
        },
        child: const Text(
          "LOG IN",
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                 Colors.black),
            alignment: Alignment.center,
            shape: MaterialStateProperty.all<
                RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: const BorderSide(color: Colors.black)
            ))),
      ),
    )
    ;
  }

}

