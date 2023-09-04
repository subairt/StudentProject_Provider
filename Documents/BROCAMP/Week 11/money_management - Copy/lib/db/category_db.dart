import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management/models/category/category_model.dart';

const categoryDBName = 'category_database';

class CategoryDB extends ChangeNotifier {
  CategoryDB.internal();
  ValueNotifier<List<CategoryModel>> categoryNotifier = ValueNotifier([]);

  static CategoryDB instance = CategoryDB.internal();

  factory CategoryDB() {
    return instance;
  }
  Future<void> getAllCategory() async {
    final categoryDB = await Hive.openBox<CategoryModel>(categoryDBName);
    categoryNotifier.value.clear();
    categoryNotifier.value.addAll(categoryDB.values);
    categoryNotifier.notifyListeners();
  }

  Future<void> insertCategory(CategoryModel value) async {
    final categoryDB = await Hive.openBox<CategoryModel>(categoryDBName);
    await categoryDB.add(value);
    getAllCategory();
  }

  Future<List<CategoryModel>> getCategories() async {
    final categoryDB = await Hive.openBox<CategoryModel>(categoryDBName);
    return categoryDB.values
        .toList(); //values iterable ayath kondu athine list lek convert cheyyanam.
    //DB type ulla data ye list lek convert cheythu.
  }

  Future<void> deleteCategory(String categoryID) async {
    final categoryDB = await Hive.openBox<CategoryModel>(categoryDBName);
    await categoryDB.delete(categoryID);
    getAllCategory();
    categoryNotifier.notifyListeners();
  }

  static deleteTransaction(transaction) {}
}
