// import 'package:flutter/material.dart';
//
// import 'account.dart';
// import 'homepage.dart';
//
//
// class bottomNavBar extends StatefulWidget {
//   const bottomNavBar({Key? key}) : super(key: key);
//
//   @override
//   State<bottomNavBar> createState() => _bottomNavBarState();
// }
//
// class _bottomNavBarState extends State<bottomNavBar> {
//
//   int _selectedIndex = 0;
//
//
//
//   void _onItemTapped(
//       int index,
//       ) {
//     setState(() {
//       _selectedIndex = index;
//       if (index == 0) {
//         Navigator.of(context)
//             .push(MaterialPageRoute(builder: (context) => const homepage()));
//       }
//       else if (index == 1) {
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) => const account()));
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  BottomNavigationBar(
//       items: const [          BottomNavigationBarItem(
//         icon: Icon(Icons.home),
//         label: "HOME",
//       ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.manage_accounts),
//           label: "ACCOUNT",
//         ),
//       ],
//       currentIndex: _selectedIndex,
//       backgroundColor: Color.fromRGBO(18, 112, 62, 0.796078431372549),
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: Colors.black,
//       unselectedItemColor: Colors.black,
//       iconSize: 30,
//       elevation: 10,
//       onTap: _onItemTapped,
//
//     );
//   }
// }
