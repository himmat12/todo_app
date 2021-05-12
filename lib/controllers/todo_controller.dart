import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo_app/global_components/get_snackbar.dart';
import 'package:simple_todo_app/models/todo_model.dart';
import 'package:simple_todo_app/utils/box.dart';

class TodoController extends GetxController {
  // bookmarks list
  var obj = ToDoModel().obs;
  var _bookmarksList = <ToDoModel>[].obs;

  List<ToDoModel> get bookmarksList => _bookmarksList;

  getBookmarks() {
    _bookmarksList =
        RxList<ToDoModel>.from(_todoList.where((e) => e.isBookmarked == true));
    _todoList.forEach((e) {
      print(e.isBookmarked);
    });

    update(['bookmarks']);
  }

  bookmark(String id) {
    late ToDoModel _todo;
    _todo = _todoList.firstWhere((e) => e.id == id);
    _todo.isBookmarked = true;
    Box.setTodos(_todoList.map((e) => jsonEncode(e.toJson())).toList());
    _todoList.refresh();
    _bookmarksList.refresh();
    getBookmarks();
    getSnackbar(
        message: 'bookmarked',
        bgColor: Colors.blue,
        leadingIcon: Icons.bookmark_added);
  }

  removeBookmark(String id) {
    late ToDoModel _todo;

    _todo = _todoList.firstWhere((e) => e.id == id);
    _todo.isBookmarked = false;
    Box.setTodos(_todoList.map((e) => jsonEncode(e.toJson())).toList());
    _todoList.refresh();
    _bookmarksList.refresh();
    getBookmarks();
    getSnackbar(
        message: 'bookmark removed',
        bgColor: Colors.red,
        leadingIcon: Icons.bookmark_remove);
  }

  /// todo list
  var _todoList = <ToDoModel>[].obs;

  List<ToDoModel> get todoList => _todoList;

  var _isEditModeEnabled = false.obs;

  bool get isEditModeEnabled => _isEditModeEnabled.value;

  getToDoList() {
    _todoList = RxList<ToDoModel>.from(
        Box.todoList.map((e) => ToDoModel.fromJson(jsonDecode(e))));
  }

  updateToDo(ToDoModel todo) {
    late ToDoModel _todo;
    _todo = _todoList.firstWhere((e) => e.id == todo.id);
    _todo.title = todo.title;
    _todo.body = todo.body;
    _todo.updatedDate = todo.updatedDate;
    _todo.updatedTime = todo.updatedTime;
    _todo.isEdited = true;

    Box.setTodos(_todoList.map((e) => jsonEncode(e.toJson())).toList());
    _todoList.refresh();
    _bookmarksList.refresh();

    getSnackbar(
        message: 'data updated',
        bgColor: Colors.green,
        leadingIcon: Icons.mode_edit_outline);
  }

  toggleEditMode() {
    _isEditModeEnabled.value = !_isEditModeEnabled.value;
  }

  addTodo(ToDoModel todo) {
    _todoList.add(todo);
    Box.setTodos(_todoList.map((e) => jsonEncode(e.toJson())).toList());
  }

  removeTodo(String id) {
    late ToDoModel _todo;
    _todo = _todoList.firstWhere((e) => e.id == id);
    _todoList.remove(_todo);
    Box.setTodos(_todoList.map((e) => jsonEncode(e.toJson())).toList());
    getSnackbar(
        message: 'data deleted',
        bgColor: Colors.red,
        leadingIcon: Icons.delete_forever);
  }

  markComplete(String id) {
    late ToDoModel _todo;

    _todo = _todoList.firstWhere((e) => e.id == id);
    if (_todo.isCompleted == false) {
      _todo.isCompleted = true;
      Box.setTodos(_todoList.map((e) => jsonEncode(e.toJson())).toList());
      _todoList.refresh();
      getBookmarks();
      getSnackbar(
          message: 'todo markded as completed',
          bgColor: Colors.green,
          leadingIcon: Icons.assignment_turned_in_outlined);
    }
  }

  markPending(String id) {
    late ToDoModel _todo;

    _todo = _todoList.firstWhere((e) => e.id == id);
    if (_todo.isCompleted == true) {
      _todo.isCompleted = false;
      Box.setTodos(_todoList.map((e) => jsonEncode(e.toJson())).toList());
      _todoList.refresh();
      getBookmarks();
      getSnackbar(
          message: 'todo markded as pending',
          bgColor: Colors.red,
          leadingIcon: Icons.assignment_return_outlined);
    }
  }

  // local box state
  clearLocalStorage() {
    _todoList.clear();
    Box.reset();
    _todoList.refresh();
    update(["todolist"]);
    getSnackbar(
        message: 'data & storage reseted',
        bgColor: Colors.blue,
        leadingIcon: Icons.sd_storage_outlined);
  }
}
