import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:money_management/models/category/category_model.dart';
import 'package:money_management/widgets/uppercase.dart';

class SlidableCategory extends StatelessWidget {
  const SlidableCategory({Key? key, required this.category}) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: const ActionPane(motion: StretchMotion(), children: []),
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 244, 240, 228),
            radius: 50,
            child: Image.asset(
              'assets/images/${category.categoryImage}.png',
              height: 30,
              width: 20,
            ),
          ),
          title: Text(category.categoryName.capitalize()),
        ),
      ),
    );
  }
}
