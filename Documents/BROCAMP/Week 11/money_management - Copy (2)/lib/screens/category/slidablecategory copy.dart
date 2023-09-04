// import 'dart:js_util';

// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:money_management/db/category_db.dart';
// import 'package:money_management/models/category/category_model.dart';
// import 'package:money_management/widgets/uppercase.dart';

// class SlidableCategory extends StatelessWidget {
//   const SlidableCategory({super.key, required this.category});

//   final  CategoryModel category;

//   @override
//   Widget build(BuildContext context) {
//     return Slidable(
//       endActionPane:  ActionPane(motion: const StretchMotion(), children: [    SlidableAction(
         
//           icon: Icons.edit,
//           foregroundColor: const Color(0xFF2E49FB), onPressed: (BuildContext context) {  },
//         ),
//         SlidableAction(
//           onPressed: ((context) {
//             showDialog(
//                 context: context,
//                 builder: ((context) {
//                   return AlertDialog(
//                     content:  Text('Do you want to Delete?'),
//                     actions: [
//                       TextButton(
//                           onPressed: (() async {
//                              await CategoryDB;
//                              delete<CategoryDB>(category,0);
//                         Navigator.of(context).pop();                         }),
//                           child: const Text(
//                             'Yes',
//                             style: TextStyle(color: Colors.red),
//                           )),
//                       TextButton(
//                           onPressed: (() {
//                             Navigator.of(context).pop();
//                           }),
//                           child: const Text(
//                             'NO',
//                             style: TextStyle(color: Colors.green),
//                           )),
//                     ],
//                   );
//                 }));
//           }),
//           icon: Icons.delete,
//           foregroundColor: Colors.red,
//         ),]),
//       child: Card(
//         color: Colors.white,
//         elevation: 3,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: ListTile(
//           leading: CircleAvatar(
//             backgroundColor: const Color.fromARGB(255, 244, 240, 228),
//             radius: 50,
//             child: Image.asset(
//               'assets/images/${category.categoryImage}.png',
//               height: 30,
//               width: 20,
//             ),
//           ),
//           // ignore: unnecessary_string_interpolations
//           title: Text('${category.categoryName.capitalize()}'),
//         ),
//       ),
//     );
//   }
// }
