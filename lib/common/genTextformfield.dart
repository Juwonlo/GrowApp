import 'package:flutter/material.dart';
import 'package:registration_sql/common/toastHelper.dart';

class getTextFormField extends StatelessWidget {
  TextEditingController controller;
  String hintName;
  IconData icon;
  bool isObscureText;
  TextInputType inputType;

  
  getTextFormField({Key? key,
    required this.controller,
    required this.hintName,
    required this.icon,
    this.isObscureText = false,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText,
        keyboardType: inputType,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter $hintName';
          }
          if (hintName == "Email"  && !validateEmail(value)) {
            return 'Please Enter Valid Email';
          }
          return null;
        },
        // onSaved: (val) => controller.text = val!,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.green),
          ),
          prefixIcon: Icon(icon),
          hintText: hintName,
          labelText: hintName,
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }
}
