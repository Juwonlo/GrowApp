// // ignore_for_file: file_names
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:howtogrow/design/bottomNavBar.dart';
// import 'package:intl/intl.dart';
// import 'account.dart';
//
// // import 'change_password.dart';
// import 'homepage.dart';
// // import 'select_branch.dart';
//
// const List<String> list = <String>["Mr. Samuel", "Mr. Victor", "Mrs. Blessing"];
//
// class Collections extends StatefulWidget {
//   const Collections({Key? key}) : super(key: key);
//
//   @override
//   State<Collections> createState() => _CollectionsState();
// }
//
// class _CollectionsState extends State<Collections> {
//   TextEditingController dateinput = TextEditingController();
//   //text editing controller for text field
//
//   @override
//   void initState() {
//     dateinput.text = ""; //set the initial value of text field
//     dateinput2.text= "";
//     super.initState();
//   }
//   TextEditingController dateinput2 = TextEditingController();
//   //text editing controller for text field
//
//   final _formKey = GlobalKey<FormState>();
//
//   void _submit() {
//     final isValid = _formKey.currentState!.validate();
//     if (isValid) {
//       return;
//     }
//     _formKey.currentState?.save();
//   }
//
//   bool isChecked = false;
//   String dropdownValue = list.first;
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
//         title: const Text("Collections"),
//       ),
//       body: SafeArea(
//         child: ListView(
//           physics: const ClampingScrollPhysics(),
//           children: [
//             Card(
//               child: Column(
//                 children: [
//                   Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8.0, vertical: 16.0),
//                           child: TextFormField(
//                             initialValue: "01234566798",
//                             obscureText: false,
//                             textInputAction: TextInputAction.done,
//                             onSaved: (value) {},
//                             decoration: const InputDecoration(
//                               fillColor: Colors.black,
//                               focusColor: Colors.black,
//                               border: OutlineInputBorder(),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black),
//                               ),
//                               labelText: "Account Number",
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "please provide Account Number";
//                               }
//                               if (value.length < 10) {
//                                 return "please provide longer Account Number";
//                               }
//                               if (value.length > 10) {
//                                 return "please provide shorter Account Number";
//                               }
//                               return null;
//                             },
//                             inputFormatters: [
//                               FilteringTextInputFormatter.digitsOnly
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextField(
//                             controller: dateinput, //editing controller of this TextField
//                             decoration: const InputDecoration(
//                               icon: Icon(Icons.calendar_today),
//                               focusColor: Colors.black,
//                               fillColor: Colors.black,
//                               border: OutlineInputBorder(),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black),
//                               ),
//                             ),
//                             readOnly: true,  //set it true, so that user will not able to edit text
//                             onTap: () async {
//                               DateTime? pickedDate = await showDatePicker(
//                                   context: context, initialDate: DateTime.now(),
//                                   firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
//                                   lastDate: DateTime(2101)
//                               );
//
//                               if(pickedDate != null ){
//                                 //pickedDate output format => 2021-03-10 00:00:00.000
//                                 String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
//                                 print(formattedDate); //formatted date output using intl package =>  2021-03-16
//                                 //you can implement different kind of Date Format here according to your requirement
//
//                                 setState(() {
//                                   dateinput.text = formattedDate; //set output date to TextField value.
//                                 });
//                               }else{
//                                 print ("Date is not selected");
//                               }
//                             },
//                           )
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             obscureText: false,
//                             textInputAction: TextInputAction.done,
//                             onSaved: (value) {},
//                             decoration: const InputDecoration(
//                               focusColor: Colors.black,
//                               fillColor: Colors.black,
//                               border: OutlineInputBorder(),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black),
//                               ),
//                               labelText: "Location",
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "please provide location";
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             obscureText: false,
//                             textInputAction: TextInputAction.done,
//                             keyboardType: TextInputType.name,
//                             onSaved: (value) {},
//                             decoration: const InputDecoration(
//                               border: OutlineInputBorder(),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black),
//                               ),
//                               labelText: "Credit",
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "please provide credit";
//                               }
//
//                               return null;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             obscureText: false,
//                             textInputAction: TextInputAction.done,
//                             keyboardType: TextInputType.name,
//                             onSaved: (value) {},
//                             decoration: const InputDecoration(
//                               border: OutlineInputBorder(),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black),
//                               ),
//                               labelText: "Debit",
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "please provide debit";
//                               }
//
//                               return null;
//                             },
//                           ),
//                         ),
//
//                         Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextField(
//                               controller: dateinput2, //editing controller of this TextField
//
//                               readOnly: true,  //set it true, so that user will not able to edit text
//                               onTap: () async {
//                                 DateTime? selectedDate = await showDatePicker(
//                                     context: context, initialDate: DateTime.now(),
//                                     firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
//                                     lastDate: DateTime(2101)
//                                 );
//
//                                 if(selectedDate != null ){
//                                   //pickedDate output format => 2021-03-10 00:00:00.000
//                                   String formatDate = DateFormat('yyyy-MM-dd').format(selectedDate);
//                                   print(formatDate); //formatted date output using intl package =>  2021-03-16
//                                   //you can implement differ
//                                   // ent kind of Date Format here according to your requirement
//
//                                   setState(() {
//                                     dateinput2.text = formatDate; //set output date to TextField value.
//                                   });
//                                 }else{
//                                   print ("Date is not selected");
//                                 }
//                               },
//                               decoration: const InputDecoration(
//                                 icon: Icon(Icons.calendar_today),
//                                 focusColor: Colors.black,
//                                 fillColor: Colors.black,
//                                 border: OutlineInputBorder(),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.black),
//                                 ),
//                               ),
//                             )
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             obscureText: false,
//                             textInputAction: TextInputAction.done,
//                             onSaved: (value) {},
//                             decoration: const InputDecoration(
//                               focusColor: Colors.black,
//                               fillColor: Colors.black,
//                               border: OutlineInputBorder(),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black),
//                               ),
//                               labelText: "Description",
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             obscureText: false,
//                             textInputAction: TextInputAction.done,
//                             onSaved: (value) {},
//                             decoration: const InputDecoration(
//                               focusColor: Colors.black,
//                               fillColor: Colors.black,
//                               border: OutlineInputBorder(),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black),
//                               ),
//                               labelText: "Marketer",
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "please provide marketer";
//                               }
//
//                               return null;
//                             },
//                             inputFormatters: [
//                               FilteringTextInputFormatter.allow(
//                                   RegExp(r"[0-9]"))
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             obscureText: false,
//                             textInputAction: TextInputAction.done,
//                             onSaved: (value) {},
//                             decoration: const InputDecoration(
//                               focusColor: Colors.black,
//                               fillColor: Colors.black,
//                               border: OutlineInputBorder(),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black),
//                               ),
//                               labelText: "Account Officer",
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "please provide officer's name";
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             obscureText: false,
//                             textInputAction: TextInputAction.done,
//                             onSaved: (value) {},
//                             decoration: const InputDecoration(
//                               focusColor: Colors.black,
//                               fillColor: Colors.black,
//                               border: OutlineInputBorder(),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black),
//                               ),
//                               labelText: "Approved by",
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "please provide  name";
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             obscureText: false,
//                             textInputAction: TextInputAction.done,
//                             onSaved: (value) {},
//                             decoration: const InputDecoration(
//                               focusColor: Colors.black,
//                               fillColor: Colors.black,
//                               border: OutlineInputBorder(),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black),
//                               ),
//                               labelText: "T Type",
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "please provide T type";
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             obscureText: false,
//                             textInputAction: TextInputAction.done,
//                             onSaved: (value) {},
//                             decoration: const InputDecoration(
//                               focusColor: Colors.black,
//                               fillColor: Colors.black,
//                               border: OutlineInputBorder(),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black),
//                               ),
//                               labelText: "Service Charge",
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "please provide  amount";
//                               }
//                               if (value.length < 5) {
//                                 return "please provide the right amount";
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             obscureText: false,
//                             textInputAction: TextInputAction.done,
//                             onSaved: (value) {},
//                             decoration: const InputDecoration(
//                               focusColor: Colors.black,
//                               fillColor: Colors.black,
//                               border: OutlineInputBorder(),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black),
//                               ),
//                               labelText: "Debit total",
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "please provide balance";
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             obscureText: false,
//                             textInputAction: TextInputAction.done,
//                             onSaved: (value) {},
//                             decoration: const InputDecoration(
//                               focusColor: Colors.black,
//                               fillColor: Colors.black,
//                               border: OutlineInputBorder(),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black),
//                               ),
//                               labelText: "Credit total",
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "please provide total";
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             obscureText: false,
//                             textInputAction: TextInputAction.done,
//                             onSaved: (value) {},
//                             decoration: const InputDecoration(
//                               focusColor: Colors.black,
//                               fillColor: Colors.black,
//                               border: OutlineInputBorder(),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black),
//                               ),
//                               labelText: "Reference",
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "please provide limit";
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             obscureText: false,
//                             textInputAction: TextInputAction.done,
//                             onSaved: (value) {},
//                             decoration: const InputDecoration(
//                               focusColor: Colors.black,
//                               fillColor: Colors.black,
//                               border: OutlineInputBorder(),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black),
//                               ),
//                               labelText: "Bank pay with 100",
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "please provide counter";
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             obscureText: false,
//                             textInputAction: TextInputAction.done,
//                             onSaved: (value) {},
//                             decoration: const InputDecoration(
//                               focusColor: Colors.black,
//                               fillColor: Colors.black,
//                               border: OutlineInputBorder(),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black),
//                               ),
//                               labelText: "Which Account",
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "please provide Account type";
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: TextFormField(
//                             obscureText: false,
//                             textInputAction: TextInputAction.done,
//                             onSaved: (value) {},
//                             decoration: const InputDecoration(
//                               focusColor: Colors.black,
//                               fillColor: Colors.black,
//                               border: OutlineInputBorder(),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black),
//                               ),
//                               labelText: "Group Id",
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return "please provide id";
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//
//
//
//                       ],
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           _submit();
//                         },
//                         child: const Text("    Deposit   "),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: bottomNavBar(),
//     );
//   }
// }
