import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
class EmailTextField extends StatefulWidget {
  final TextEditingController controller ;
  const EmailTextField({Key? key, required this.controller,}) : super(key: key);
  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}
class _EmailTextFieldState extends State<EmailTextField> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return  Center(
        child: TextFormField(
          controller: widget.controller,
          autofillHints: const [AutofillHints.email],
          validator: (email) =>
          email!=null&&!EmailValidator.validate(email)
              ?'Enter a valid email'
              : null,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            // validator: (value) {
            //   if (value.isEmpty) {
            //     return 'Please enter some text';
            //   }
            //   return null;
            // },
            border: OutlineInputBorder(
              borderSide:
              const BorderSide(color: Colors.black, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            // hintText: emailValidator(),
          ),
        )
    );
  }
}