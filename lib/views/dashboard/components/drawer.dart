import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo_app/controllers/todo_controller.dart';
import 'package:simple_todo_app/controllers/utility_controller.dart';
import 'package:simple_todo_app/views/dashboard/components/create_todo_form.dart';
import 'package:simple_todo_app/views/settings.dart';
import 'package:simple_todo_app/views/storage.dart';

Widget drawerBuilder(BuildContext context) {
  final controller = Get.find<UtilityController>();
  final todoController = Get.find<TodoController>();

  return Obx(
    () => Drawer(
      child: ListView(
        children: [
          Container(
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Text(
              'Simple ToDo App',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              controller.setIndex(0);
              Get.back();
              Get.to(
                () => CreateToDo(),
                preventDuplicates: true,
                fullscreenDialog: true,
              );
            },
            title: Text("Create ToDo"),
            trailing: Icon(
              Icons.add,
              size: 22,
            ),
          ),
          Divider(),
          ListTile(
            onTap: () {
              controller.setIndex(0);
              Get.back();
            },
            title: Text("ToDo List (${todoController.todoList.length})"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
          ListTile(
            onTap: () {
              controller.setIndex(1);
              Get.back();
            },
            title: Text("Bookmarks (${todoController.bookmarksList.length})"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Get.to(() => StoragePage());
            },
            title: Text("Data & Storage"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
          ListTile(
            onTap: () {
              Get.to(() => SettingsPage());
            },
            title: Text("Settings & Preferences"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
        ],
      ),
    ),
  );
}
