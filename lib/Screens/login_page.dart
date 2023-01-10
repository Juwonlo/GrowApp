import 'package:flutter/material.dart';
import 'package:registration_sql/Model/UserModel.dart';
import 'package:registration_sql/Screens/signUp_page.dart';
import 'package:registration_sql/common/loginsignupHeader.dart';
import 'package:registration_sql/common/toastHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../DatabaseHandler/dbhelper.dart';
import '../common/genTextformfield.dart';
import 'HomeForm.dart';
import 'dart:async';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final _formKey = GlobalKey<FormState>();
  final _conUserid = TextEditingController();
  final _conPassword = TextEditingController();
  var dbHelper;
  @override
  void initState(){
    dbHelper = DbHelper();
    super.initState();
  }

  login() async{
    String uid = _conUserid.text;
    String passed = _conPassword.text;

    if (uid.isEmpty){
        //alertDialog(context, 'Please Enter User ID');
      showToast(context, 'Please Enter User ID');
    }else if(passed.isEmpty){
      //alertDialog(context, 'Please Enter Password');
      showToast(context, 'Please Enter Password');
    }else {
        await dbHelper.getLoginUser(uid,passed).then((userData) {
          if (userData != null) {

            setSP(userData).whenComplete((){

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => HomeForm()),
                      (Route<dynamic> route) => false);
            });
        } else {
          showToast(context, 'Error: User Not Found');
        }
        }).catchError((error){
          print(error);
          //alertDialog(context, "Error: Login FAIL");
          showToast(context, 'Error: Login FAIL');
        });
    }
  }


  Future setSP(UserModel user)  async{
      final SharedPreferences sp = await _pref;

      sp.setString("user_id", user.user_id);
      sp.setString("user_name", user.user_name);
      sp.setString("email", user.email);
      sp.setString("password", user.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login With SignUp'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              getLoginSignupHeader(
                'Login'
              ),
                ///UserID
                getTextFormField(
                    controller: _conUserid,
                    hintName: 'User ID',
                    icon: Icons.person_outline),
                const SizedBox(height: 10),
                ///password
                getTextFormField(
                    controller: _conPassword,
                    hintName: 'Password',
                    icon: Icons.lock_outline,
                  isObscureText: true,
                ),
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
                    child:  TextButton(
                        onPressed: login,
                        child: const Text('Login',
                        style: TextStyle(color: Colors.white),
                        ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Does not have an account?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      TextButton(onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const SignUpPage()));
                      },
                          child: const Text('SignUp',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
