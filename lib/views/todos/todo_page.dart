import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo_app/controllers/todo_controller.dart';
import 'package:simple_todo_app/controllers/utility_controller.dart';
import 'package:simple_todo_app/models/todo_model.dart';

import 'components/todo_tile.dart';

class TodoPage extends StatelessWidget {
  final List<ToDoModel>? list = [];

  final TodoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: "todolist",
      init: controller,
      initState: (_) {
        controller.getToDoList();
      },
      builder: (_) {
        return Column(
          children: [
            Obx(
              () => ListView.separated(
                reverse: true,
                separatorBuilder: (context, index) => SizedBox(height: 12),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.todoList.length,
                itemBuilder: (context, index) {
                  ToDoModel todo = controller.todoList[index];

                  return todoTile(todo);
                },
              ),
            )
          ],
        );
      },
    );
  }
}
