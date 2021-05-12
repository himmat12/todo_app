// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:simple_todo_app/models/category_model.dart';
// import 'package:simple_todo_app/utils/box.dart';

// var _categories = <CategoryModel>[].obs;

// class CategoryController extends GetxController {
//   List<CategoryModel> get categories => _categories;

//   getCategories() {
//     if (_categories.isEmpty) {
//       CategoryModel category = CategoryModel(
//         id: UniqueKey().toString(),
//         title: "uncategorized",
//       );
//       addCategory(category);
//     }
//     _categories = RxList<CategoryModel>.from(
//         Box.categories.map((e) => CategoryModel.fromJson(jsonDecode(e))));
//     _categories.refresh();
//     update(["categories"]);
//   }

//   addCategory(CategoryModel category) {
//     _categories.add(category);
//     Box.setCategories(
//         List<String>.from(_categories.map((e) => jsonEncode(e.toJson()))));
//   }

//   removeCategory(String id) {
//     late CategoryModel _category;
//     _category = _categories.firstWhere((e) => e.id == id);
//     _categories.remove(_category);
//   }
// }
