import 'package:flutter/material.dart';
import 'package:registration_sql/Model/UserModel.dart';
import 'package:registration_sql/Screens/login_page.dart';
import 'package:registration_sql/common/loginsignupHeader.dart';
import 'package:registration_sql/common/toastHelper.dart';
import 'package:toast/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../DatabaseHandler/dbhelper.dart';
import '../common/genTextformfield.dart';
import 'HomeForm.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _formKey = GlobalKey<FormState>();

  final _conUserid = TextEditingController();
  final _conUserName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  final _conCPassword = TextEditingController();
  var dbHelper;

  @override
  void initState(){
    dbHelper = DbHelper();
      super.initState();
  }

  signUp() async {
    // print('OK');

    String uid = _conUserid.text;
    String uname = _conUserName.text;
    String email = _conEmail.text;
    String passed = _conPassword.text;
    String cpassed = _conCPassword.text;

    if(_formKey.currentState!.validate()){
      if(passed !=cpassed){
        //alertDialog(context,'Password Mismatch');
        showToast(context, 'Password Mismatch');

      } else {
        _formKey.currentState?.save();


        UserModel uModel = UserModel(uid, uname, email, passed);
        await dbHelper.saveData(uModel).then((userData){
          //alertDialog(context, 'Successfully Saved');
         showToast(context, 'Successfully Saved');

         Navigator.push(
             context,
             MaterialPageRoute(builder: (_) => LoginPage()));
        }).catchError((error){
          print(error);
          //alertDialog(context, 'Error: Data Save FAIL');
          showToast(context, 'Error: Data Save FAIL');

        });

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getLoginSignupHeader('SignUp'),
                getTextFormField(
                    controller: _conUserid,
                    hintName: 'User ID',
                    icon: Icons.person),
                const SizedBox(height: 10),
                getTextFormField(
                    controller: _conUserName,
                    hintName: 'UserName',
                    inputType: TextInputType.name,
                    icon: Icons.person_outline_outlined),
                const SizedBox(height: 10),
                getTextFormField(
                    controller: _conEmail,
                    hintName: 'Email',
                    inputType: TextInputType.emailAddress,
                    icon: Icons.mail_outlined),
                const SizedBox(height: 10),
                getTextFormField(
                    isObscureText: true,
                    controller: _conPassword,
                    hintName: 'Password',
                    icon: Icons.lock_outline),
                const SizedBox(height: 10),
                getTextFormField(
                    isObscureText: true,
                    controller: _conCPassword,
                    hintName: 'Confirm Password',
                    icon: Icons.lock_outline),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      onPressed: signUp,
                      child: const Text(
                        'Create Account',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already Have an account?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const LoginPage()),
                              (Route<dynamic> route) => false);
                        },
                        child: const Text(
                          'SignIn',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
