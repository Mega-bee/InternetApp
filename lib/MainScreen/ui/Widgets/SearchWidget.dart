import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}
class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleHint = TextStyle(color: Colors.grey);
    final styleActive = TextStyle(color: Colors.black);
    final style = widget.text.isEmpty ? styleHint : styleActive;
    return TextFormField(

      cursorColor: Colors.purple,
      decoration: InputDecoration(
        hoverColor: Colors.purple,
        contentPadding: const EdgeInsets.all(15),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(

          borderSide:
          const BorderSide(color: Colors.red, width: 8.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: widget.hintText,
        hintStyle: style,
        prefixIcon: IconButton(
            icon: Icon(Icons.search,color: Colors.black,),
            onPressed: () {}
        ),
        suffixIcon: widget.text.isNotEmpty
            ? GestureDetector(
          child: Icon(Icons.close, color: Colors.black),
          onTap: () {
            controller.clear();
            widget.onChanged('');
            FocusScope.of(context).requestFocus(FocusNode());
          },
        )
            : null,
      ),
      style: style,
      onChanged:widget.onChanged,
    );
  }
}
