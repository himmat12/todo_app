import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo_app/controllers/todo_controller.dart';
import 'package:simple_todo_app/controllers/utility_controller.dart';

class StoragePage extends StatelessWidget {
  final todoController = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data & Storage'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                todoController.clearLocalStorage();
              },
              trailing: Icon(
                Icons.sd_storage,
                size: 20,
              ),
              title: Text('Clear data & storage'),
            )
          ],
        ),
      ),
    );
  }
}
