import 'package:flutter/material.dart';

class getLoginSignupHeader extends StatelessWidget {

  String headerName;
  getLoginSignupHeader(this.headerName);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:  [
          const SizedBox(height: 50),
           Text(headerName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
              fontSize: 40,
            ),),
          const SizedBox(height: 10),
          Image.asset('assets/images/ticky.png',
            height: 150,
            width: 200,
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
