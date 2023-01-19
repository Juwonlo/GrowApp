// import 'package:flutter/material.dart';
// import 'package:howtogrow/Screens/account.dart';
// import 'package:howtogrow/Screens/homepage.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:howtogrow/Screens/select_branch.dart';
// import 'package:howtogrow/design/bottomNavBar.dart';
//
// class Change extends StatefulWidget {
//   const Change({Key? key}) : super(key: key);
//
//   @override
//   State<Change> createState() => _ChangeState();
// }
//
// class _ChangeState extends State<Change> {
//
//   List widgetOptions = [
//     const homepage(),
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Change Password"),
//         actions: [
//           PopupMenuButton(
//               icon: const Icon(Icons.person),
//               itemBuilder: (context) => [
//                     PopupMenuItem(
//                         value: 1,
//                         child: Row(
//                           children: const [
//                             Icon(Icons.password),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text("Change Password", style: TextStyle(color: Colors.white),),
//                           ],
//                         )),
//                     PopupMenuItem(
//                         value: 2,
//                         child: Row(
//                           children: const [
//                             Icon(Icons.place),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text("Select Branch", style: TextStyle(color: Colors.white),)
//                           ],
//                         )),
//                     PopupMenuItem(
//                       value: 3,
//                       child: Row(
//                         children: const [
//                           Icon(Icons.logout),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text("Log Out", style: TextStyle(color: Colors.white),),
//                         ],
//                       ),
//                     ),
//                   ],
//               offset: const Offset(0, 50),
//               color: Colors.blueAccent,
//               elevation: 4,
//               splashRadius: 10,
//               onSelected: (value) {
//                 if (value == 1) {
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) => const Change()));
//                 } else if( value == 2) {
//                   Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const branch())
//                   );
//                 }
//               }),
//         ],
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children:const [
//
//                     Text("Change Password"),
//                     Icon(FontAwesomeIcons.key),
//                   ],
//                 ),
//                 Container(
//                   height: 274,
//                   width: 400,
//                   padding: const EdgeInsets.all(10.0),
//                   child: Card(
//                     color: Colors.white,
//                     elevation: 7,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15.0),
//                     ),
//                     child: Form(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 8.0, vertical: 16.0),
//                             child: TextFormField(
//                               obscureText: true,
//                               textInputAction: TextInputAction.done,
//                               onSaved: (value) {
//                               },
//                               decoration: const InputDecoration(
//                                 fillColor: Colors.black,
//                                 focusColor: Colors.black,
//                                 border: OutlineInputBorder(),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.black),
//                                 ),
//                                 labelText: "OLD PASSWORD",
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return "please provide password";
//                                 }
//                                 if (value.length < 5) {
//                                   return "please provide longer password";
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextFormField(
//                               obscureText: true,
//                               textInputAction: TextInputAction.done,
//                               onSaved: (value) {
//                               },
//                               decoration: const InputDecoration(
//                                 border: OutlineInputBorder(),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.black),
//                                 ),
//                                 labelText: "NEW PASSWORD",
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return "please provide password";
//                                 }
//                                 if (value.length < 5) {
//                                   return "please provide longer password";
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextFormField(
//                               obscureText: true,
//                               textInputAction: TextInputAction.done,
//                               onSaved: (value) {
//                               },
//                               decoration: const InputDecoration(
//                                 focusColor: Colors.black,
//                                 fillColor: Colors.black,
//                                 border: OutlineInputBorder(),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.black),
//                                 ),
//                                 labelText: "CONFIRM PASSWORD",
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return "please provide password";
//                                 }
//                                 if (value.length < 5) {
//                                   return "please provide longer password";
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.red, ),
//                         child:const Text("     Reset     "),
//
//                     ),
//                     ElevatedButton(
//                       onPressed: () {},
//                       child:const Text("     Save     "),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: bottomNavBar(),
//     );
//   }
// }
