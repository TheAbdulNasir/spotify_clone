// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:scar/route/color.dart';
// import 'package:scar/route/image.dart';
// import 'package:searchable_dropdown/searchable_dropdown.dart';
//
// // AppBar
// Widget appBarWidget(String title) {
//   return AppBar(
//     title: Text(title),
//     flexibleSpace: Container(
//       decoration: BoxDecoration(
//         gradient: gradientColor(),
//       ),
//     ),
//   );
// }
//
// // AppBar Without Title
// Widget appBarWithoutTitleWidget() {
//   return AppBar(
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       iconTheme: IconThemeData(color: textColor));
// }
//
// // GradientColor
// LinearGradient gradientColor() {
//   return LinearGradient(
//     begin: Alignment.centerLeft,
//     end: Alignment.centerRight,
//     colors: <Color>[mainColor, greenColor],
//   );
// }
//
// // Normal Text
// Widget normalTextWidget(String text, double fs) {
//   return Text(
//     text,
//     style: TextStyle(color: Colors.grey, fontSize: fs),
//   );
// }
//
// // Normal Text
// Widget whiteTextWidget(String text, double fs) {
//   return Text(
//     text,
//     style: TextStyle(color: Colors.white, fontSize: fs, fontWeight: FontWeight.bold),
//   );
// }
//
//
// // grey Text
// Widget greyTextWidget(String text, double fs) {
//   return Text(
//     text,
//     style: TextStyle(color: Colors.grey, fontSize: fs,fontWeight: FontWeight.w500),
//   );
// }
//
// // Normal Text
// Widget underLinTextWidget(String text, double fs,Color color) {
//   return Text(
//     text,
//     style: TextStyle(color: color, fontSize: fs,decoration: TextDecoration.underline),
//   );
// }
//
// // Bold Text
// Widget boldTextWidget(String text, double fs) {
//   return Text(
//     text,
//     style:
//         TextStyle(color: greenColor, fontSize: fs, fontWeight: FontWeight.bold),
//   );
// }
//
// // grey Text
// Widget colorTextWidget(String text, double fs) {
//   return Text(
//     text,
//     style: TextStyle(color: textColor, fontSize: fs,fontWeight: FontWeight.w500),
//   );
// }
//
// // selectDate
// Widget selectDateWidget(String text, IconData icon, Function fun) {
//   return  GestureDetector(
//     onTap: () async {fun();},
//     child: Row(
//       children: [
//         Card(
//           elevation: 10,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//           child:  SizedBox(
//               height: 45,
//               width: Get.width/1.5,
//               child: Center(child: colorTextWidget(text,18))
//           ),
//         ),
//         const Spacer(),
//         Icon(icon,color: mainColor,size: 30,),
//         const SizedBox(width: 20),
//       ],
//     ),
//   );
// }
//
// //Divider
// Widget dividerWidget() {
//   return const Divider(
//     color: Colors.grey,
//     thickness: 1,
//   );
// }
//
// //tripcontainer
//
// Widget tripContainerWidget(String text, String image, Function fun) {
//   return Padding(
//     padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
//     child: GestureDetector(
//       onTap: () {
//         fun();
//       },
//       child: Card(
//         elevation: 10,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         child: Row(children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   text,
//                   style: TextStyle(
//                       color: mainColor,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: Get.width / 15,
//                 ),
//                 Icon(
//                   Icons.arrow_forward,
//                   color: textColor,
//                 ),
//               ],
//             ),
//           ),
//           const Spacer(),
//           Image.asset(
//             image,
//             height: 80,
//             width: 150,
//           ),
//         ]),
//       ),
//     ),
//   );
// }
//
// Widget tripSecondContainerWidget(String text,String secondText, Function fun) {
//   return Padding(
//     padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
//     child: GestureDetector(
//       onTap: () {
//         fun();
//       },
//       child: Card(
//         elevation: 10,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         child: Row(children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   text,
//                   style: TextStyle(
//                       color: mainColor,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   secondText,
//                   style: TextStyle(
//                       color: mainColor,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Icon(
//                   Icons.arrow_forward,
//                   color: textColor,
//                 ),
//               ],
//             ),
//           ),
//           // const Spacer(),
//           // Image.asset(
//           //   image,
//           //   height: 80,
//           //   width: 150,
//           // ),
//         ]),
//       ),
//     ),
//   );
// }
//
//
// //button
// Widget kPrimaryButton(String text, Function fun) {
//   return GestureDetector(
//     onTap: () async {
//       fun();
//     },
//     child: Card(
//       elevation: 10,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20.0),
//       ),
//       child: Container(
//         height: 45,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           gradient: gradientColor(),
//         ),
//         child: Center(
//             child: Text(text,
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color:Colors.white))),
//       ),
//     ),
//   );
// }
//
//
// Widget buildSearchableDropdown(item,value,Function fn(value),hint,searchHint) {
//   return SearchableDropdown.single(
//     style: const TextStyle(
//         fontWeight: FontWeight.w500, color: Colors.black, fontSize: 18),
//     items: item,
//     value: value,
//     hint: hint,
//     searchHint: searchHint,
//     onChanged: (value) {
//      fn(value);
//     },
//     doneButton: (selectedItemsDone, doneContext) {
//       return (ElevatedButton(
//           onPressed: () {
//             Get.back();
//           },
//           child: const Text("Save")));
//     },
//     underline: Container(
//       height: 1.0,
//       decoration: BoxDecoration(
//           border: Border(bottom: BorderSide(color: mainColor, width: 3.0))),
//     ),
//     displayItem: (item, selected) {
//       return (Row(children: [
//         selected
//             ? const Icon(
//           Icons.radio_button_checked,
//           color: Colors.grey,
//         )
//             : const Icon(
//           Icons.radio_button_unchecked,
//           color: Colors.grey,
//         ),
//         const SizedBox(width: 7),
//         Expanded(
//           child: item,
//         ),
//       ]));
//     },
//     isExpanded: true,
//   );
// }
//
//
// showAlertDialog(BuildContext context,controller) {
//   // set up the buttons
//   Widget cancelButton = TextButton(
//     child: const Text("Camera"),
//     onPressed: () {
//       controller.getImage(ImageSource.camera);
//       Get.back();
//     },
//   );
//   Widget continueButton = TextButton(
//     child: const Text("Gallery"),
//     onPressed: () {
//       controller.getImage(ImageSource.gallery);
//       Get.back();
//     },
//   );
//
//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     actions: [
//       cancelButton,
//       continueButton,
//     ],
//   );
//
//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
