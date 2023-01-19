// // ignore_for_file: camel_case_types
//
// import 'package:flutter/material.dart';
// import 'package:howtogrow/Screens/account.dart';
// import 'package:howtogrow/Screens/password/change_password.dart';
// import 'package:howtogrow/Screens/homepage.dart';
// import 'package:howtogrow/design/bottomNavBar.dart';
//
// const List<String> list = <String>[
//   "UNIT",
//   "NKPOR MKT",
//   "BUILDING MKT",
//   "RELIEF MKT",
//   "UGWUAGBA ABOSI MKT",
//   "BRIDGE HEAD MKT",
//   "OCHANJA MKT",
//   "PLASTIC MKT",
//   "MAIN MKT",
//   "NNEWI MKT"
// ];
//
// class branch extends StatefulWidget {
//   const branch({Key? key}) : super(key: key);
//
//   @override
//   State<branch> createState() => _branchState();
// }
//
// class _branchState extends State<branch> {
//   String dropdownValue = list.first;
//
//   List widgetOptions = [
//     const homepage(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Branch"),
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
//               offset: const Offset(0, 50),
//               color: Colors.blueAccent,
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
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Card(
//               child: SizedBox(
//                 width: 300,
//                 child: DropdownButtonFormField(
//                    alignment : AlignmentDirectional.center,
//                   hint: const Text("UNIT"),
//                   isExpanded: true,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderSide: const BorderSide(),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       dropdownValue = newValue!;
//                     });
//                   },
//                   items: list.map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.red,
//                   ),
//                   child: const Text("     Reset     "),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: const Text("     Save     "),
//                 ),
//               ],
//             ),
//           ],
//         )),
//       ),
//       bottomNavigationBar: bottomNavBar(),
//     );
//   }
// }
