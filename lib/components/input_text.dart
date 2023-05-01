import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  InputText({
    Key? key,
    this.text,
    this.icon,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.iconButton,
    required this.obscure,
  }) : super(key: key);
  final String? text;
  final Icon? icon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final IconButton? iconButton;
  String? Function(String?)? validator;
  bool obscure;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, top: 8, right: 25),
      child: TextFormField(
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: text!,
          hintStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
              color: Colors.grey),
          prefixIcon: icon,
          suffixIcon: iconButton,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 0,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          border: OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }
}
