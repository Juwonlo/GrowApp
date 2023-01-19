// // ignore_for_file: camel_case_types
//
// import 'package:flutter/material.dart';
//
//
// import 'bottomNavBar.dart';
// import 'homepage.dart';
//
//
// class account extends StatefulWidget {
//   const account({Key? key}) : super(key: key);
//
//   @override
//   State<account> createState() => _accountState();
// }
//
// class _accountState extends State<account> {
//
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
//
//         title: const Text("ACCOUNT"),
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
//               color: Color.fromRGBO(18, 112, 62, 0.796078431372549),
//               elevation: 4,
//               splashRadius: 10,
//               onSelected: (value) {
//                 if (value == 1) {
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) => const Change()));
//                 } else if (value == 2) {
//                   Navigator.of(context)
//                       .push(MaterialPageRoute(builder: (context) => const branch()));
//                 }
//               }),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           // Important: Remove any padding from the ListView.
//           padding: EdgeInsets.zero,
//           children: [
//             SizedBox(
//               height: 100,
//               child:  DrawerHeader(
//                 decoration: BoxDecoration(
//                  image: DecorationImage(
//                      image: AssetImage("assets/howtogroww.png"),
//                  alignment: Alignment.topRight),
//                   color: Color.fromRGBO(18, 112, 62, 0.796078431372549),
//                 ),
//                 child: Text('How To Grow', style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 25, ),),
//               ),
//             ),
//             ListTile(
//               leading: const Icon(
//                 Icons.home,
//               ),
//               title: const Text('Home'),
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const homepage()));
//               },
//             ),
//             ListTile(
//               leading: const Icon(
//                 Icons.person,
//               ),
//               title: const Text('View Profile'),
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const MyProfile()));
//               },
//             ),
//             ListTile(
//               leading: const Icon(
//                 Icons.money,
//               ),
//               title: const Text('Deposit'),
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Deposit()));
//               },
//             ),
//             ListTile(
//               leading: const Icon(
//                 Icons.money,
//               ),
//               title: const Text('Collections'),
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Collections()));
//               },
//             ),
//             ListTile(
//               leading: const Icon(
//                 Icons.password,
//               ),
//               title: const Text('Change Password'),
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Change()));
//               },
//             ),
//             ListTile(
//               leading:const Icon(
//                 Icons.logout,
//               ),
//               title: const Text('Log Out'),
//               onTap: () {
//               },
//             ),
//           ],
//         ),
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children:[
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
