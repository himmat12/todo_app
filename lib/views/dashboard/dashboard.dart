import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo_app/controllers/utility_controller.dart';
import 'package:simple_todo_app/controllers/todo_controller.dart';
import 'package:simple_todo_app/views/bookmark/bookmark.dart';
import 'package:simple_todo_app/views/dashboard/components/create_todo_form.dart';
import 'package:simple_todo_app/views/todos/todo_page.dart';

import 'components/drawer.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final todoController = Get.put(TodoController());
  final utilityController = Get.put(UtilityController());

  final List<Widget> pages = [
    TodoPage(),
    BookmarkPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        throw showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actions: [
              TextButton(
                onPressed: () {
                  exit(1);
                },
                child: Text('exit'),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('cancle'),
              ),
            ],
            content: Text("do you want to exit?"),
          ),
        );
      },
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            title: Text('Todo App'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  utilityController.toggleTheme();
                },
                icon: Obx(
                  () => Icon(utilityController.isDark == true
                      ? Icons.light_mode
                      : Icons.dark_mode),
                ),
              ),
            ],
          ),
          drawer: drawerBuilder(context),
          floatingActionButton: utilityController.currentIndex == 1
              ? SizedBox()
              : FloatingActionButton(
                  onPressed: () {
                    Get.to(
                      () => CreateToDo(),
                      preventDuplicates: true,
                      fullscreenDialog: true,
                    );
                  },
                  child: Icon(Icons.add),
                ),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
                onTap: (newIndex) {
                  utilityController.setIndex(newIndex);
                },
                currentIndex: utilityController.currentIndex,
                type: BottomNavigationBarType.fixed,
                items: List.from(
                  menus.map(
                    (e) => BottomNavigationBarItem(icon: SizedBox(), label: e),
                  ),
                ),
              )),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Obx(() => Column(
                  children: [
                    pages[utilityController.currentIndex],
                    SizedBox(height: 60),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

List<String> menus = [
  'Todos',
  'Bookmarks',
];
