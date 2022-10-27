import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';

// alertDialog(BuildContext context, String msg){
//   Toast.show(msg, duration: 4, gravity: Toast.bottom);
// }

validateEmail(String email){
  final emailReg = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return emailReg.hasMatch(email);
}

showToast(BuildContext context, String msg) {
  Fluttertoast.showToast(
      //toastLength:
      msg: msg,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
  );
}





// if (uid.isEmpty) {
//   alertDialog(context,"Please Enter User ID");
// } else if (uname.isEmpty) {
//   alertDialog(context,"Please Enter User Name");
// } else if (email.isEmpty) {
//   alertDialog(context,"Please Enter Email");
// } else if (passed.isEmpty) {
//   alertDialog(context,"Please Enter Password");
// } else if (cpassed.isEmpty) {
//   alertDialog(context,"Please Confirm Password");
// }