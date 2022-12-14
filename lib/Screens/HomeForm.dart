import 'package:flutter/material.dart';
import 'package:registration_sql/DatabaseHandler/dbhelper.dart';
import 'package:registration_sql/Model/UserModel.dart';
import 'package:registration_sql/Screens/login_page.dart';
import 'package:registration_sql/common/toastHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/genTextformfield.dart';

class HomeForm extends StatefulWidget {

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {

  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();


  late DbHelper dbHelper;
  final _formKey = GlobalKey<FormState>();
  final _conDelUserid = TextEditingController();
  final _conUserName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();


  @override
  void initState() {
    super.initState();
    getUserData();

    dbHelper = DbHelper();
  }

  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;
    
    setState(() {
      _conDelUserid.text = sp.getString("user_id")!;
      _conUserName.text = sp.getString("user_name")!;
      _conEmail.text = sp.getString("email")!;
      _conPassword.text = sp.getString("password")!;

    });
  }

  update() async {

    String uid = _conDelUserid.text;
    String uname = _conUserName.text;
    String email = _conEmail.text;
    String passed = _conPassword.text;

    if(_formKey.currentState!.validate()){

      _formKey.currentState?.save();


      UserModel user = UserModel( uid, uname , email, passed);
      await dbHelper.updateUser(user).then((value){
        if (value == 1) {
          showToast(context, 'Successfully Updated');

          updateSP(user, true).whenComplete((){
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
                    (Route<dynamic> route) => false);

          });
        }else {
          showToast(context, 'Error: Update Failed');
        }

      }).catchError((error){
        print(error);
        showToast(context, 'Error');
      });
    }

  }
  delete() async{
   String uid = _conDelUserid.text;
   String uname = _conUserName.text;
   String email = _conEmail.text;
   String passed = _conPassword.text;

   UserModel delUser = UserModel( uid, uname , email, passed);
   await dbHelper.deleteUser(uid).then((value) {
     if (value == 0) {
       showToast(context, "Successfully Deleted");

       updateSP(delUser, false).whenComplete(() {
         Navigator.pushAndRemoveUntil(
             context,
             MaterialPageRoute(builder: (_) => LoginPage()),
                 (Route<dynamic> route) => false);
       });
     }else {
       showToast(context, 'Error: Delete Failed');
     }
   });
   }

  Future updateSP(UserModel user, bool add) async{

    final SharedPreferences sp = await _pref;

    if (add){
      sp.setString("user_name", user.user_name);
      sp.setString("email", user.email);
      sp.setString("password", user.password);
    }else{
      sp.remove('user_id');
      sp.remove('user_name');
      sp.remove('email');
      sp.remove('password');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title:  const Text('Home')),

      body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.only(top: 20.0,),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///UPDATE FEATURES
                  getTextFormField(
                      controller: _conDelUserid,
                      hintName: 'User ID',
                      icon: Icons.person,
                    isEnable: false,
                  ),
                  const SizedBox(height: 10),
                  getTextFormField(
                      controller:_conUserName,
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
                 Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30),
                ),
                child:  TextButton(
                  onPressed: update,
                  child:  const Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
                  const SizedBox(height: 30),
                ///DELETE FEATURES
                  getTextFormField(
                    controller: _conDelUserid,
                    hintName: 'User ID',
                    icon: Icons.person,
                    isEnable: false,
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child:  TextButton(
                    onPressed: delete,
                    //delete,
                      child:  const Text(
                        'Delete',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                    ],
                  ),
            ),
            ),
        ),
        ),
      ),
    );
  }
}
