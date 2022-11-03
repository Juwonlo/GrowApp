import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/genTextformfield.dart';

class HomeForm extends StatefulWidget {

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {

  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  String userName = "";
  final _formKey = GlobalKey<FormState>();
  final _conUserid = TextEditingController();
  final _conUserName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();


  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;
    
    setState(() {
      _conUserid.text = sp.getString("user_name")!;
      _conUserName.text = sp.getString("user_name")!;
      _conEmail.text = sp.getString("user_name")!;
      _conPassword.text = sp.getString("user_name")!;

    });
  }

  update(){

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getTextFormField(
                    controller: _conUserid,
                    hintName: 'User ID',
                    icon: Icons.person,
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
                  ],
                ),
            ),
        ),
        ),
      ),
    );
  }
}
