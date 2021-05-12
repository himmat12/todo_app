import 'package:get_storage/get_storage.dart';

final box = GetStorage('box');

class Box {
  static setTodos(List<String> todos) => box.write("todos", todos);

  static List get todoList => box.read("todos") ?? [];

  static setBookmarks(List<String> todos) => box.write("bookmarks", todos);

  static List get bookamrks => box.read("bookmarks") ?? [];

  static setCategories(List<String> categories) =>
      box.write('categories', categories);

  static List get categories => box.read('categories');

  static reset() {
    box.erase();
  }
}
