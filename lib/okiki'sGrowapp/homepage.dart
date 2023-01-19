// import 'package:flutter/material.dart';
// import 'package:howtogrow/Screens/password/change_password.dart';
// import 'package:howtogrow/Screens/select_branch.dart';
// import 'package:registration_sql/okiki'sGrowapp/bottomNavBar.dart';
//
// // ignore: camel_case_types
// class homepage extends StatefulWidget {
//   const homepage({Key? key}) : super(key: key);
//
//   @override
//   State<homepage> createState() => _homepageState();
// }
//
// // ignore: camel_case_types
// class _homepageState extends State<homepage> {
//   List widgetOptions = [
//     const homepage(),
//   ];
//
//   String dropdownvalue = 'Log Out';
//   var items = ["Change password", "Select Branch", "Log Out"];
//   final List<Widget> pages = [
//     const homepage(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Container(
//             height: 200,
//             width: 200,
//             decoration: BoxDecoration(
//               border: Border.all(
//                 width: 3,
//                 color: Colors.white,
//               ),
//             ),
//             child: Image(image: AssetImage("assets/howtogroww.png"))),
//         title: const Text("HOW TO GROW"),
//         actions: [
//           PopupMenuButton(
//               itemBuilder: (context) => [
//                     PopupMenuItem(
//                         value: 1,
//                         child: Row(
//                           children: const [
//                             Icon(Icons.password),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               "Change Password",
//                               style: TextStyle(color: Colors.white),
//                             ),
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
//                             Text(
//                               "Select Branch",
//                               style: TextStyle(color: Colors.white),
//                             )
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
//                           Text(
//                             "Log Out",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//               icon: const Icon(Icons.person),
//               offset: const Offset(0, 50),
//               color: Color.fromRGBO(18, 112, 62, 0.796078431372549),
//               elevation: 4,
//               splashRadius: 10,
//               onSelected: (value) {
//                 if (value == 1) {
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) => const Change()));
//                 } else if (value == 2) {
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) => const branch()));
//                 }
//               }),
//         ],
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: 250,
//                 height: 250,
//                 child: Image.asset('assets/howtogroww.png'),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: bottomNavBar(),
//     );
//   }
// }
