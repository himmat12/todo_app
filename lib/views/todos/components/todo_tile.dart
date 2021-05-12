import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo_app/controllers/category_controller.dart';
import 'package:simple_todo_app/controllers/todo_controller.dart';
import 'package:simple_todo_app/controllers/utility_controller.dart';
import 'package:simple_todo_app/views/dashboard/components/create_todo_form.dart';
import 'package:simple_todo_app/views/todos/components/todo_component.dart';
import 'package:simple_todo_app/models/todo_model.dart';

Widget todoTile(ToDoModel todo) {
  final utilityController = Get.find<UtilityController>();
  final todoController = Get.find<TodoController>();

  return Obx(
    () => GestureDetector(
      onTap: () {
        Get.to(
          () => ToDoComponent(todo: todo),
          fullscreenDialog: true,
        );
      },
      onLongPress: () {
        Get.showSnackbar(GetBar(
          onTap: (value) {
            Get.back();
          },
          message: 'do you want to delete ?',
          animationDuration: Duration(milliseconds: 600),
          isDismissible: true,
          shouldIconPulse: true,
          dismissDirection: SnackDismissDirection.HORIZONTAL,
          icon: Icon(
            Icons.delete_forever,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          mainButton: TextButton(
            onPressed: () {
              Get.back();
              todoController.removeTodo(todo.id ?? "");
            },
            child: Text('Delete'),
          ),
        ));
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        // color: Colors.black12,
        decoration: BoxDecoration(
          color: utilityController.isDark == true
              ? Colors.grey.shade700
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            // utilityController.isDark != true
            // ? BoxShadow(
            //     color: Colors.grey.shade200,
            //     blurRadius: 4,
            //     offset: Offset(1, 2),
            //     spreadRadius: 2.0,
            //   )
            // :
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(1, 2),
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.title ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        todo.body ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: utilityController.isDark == true
                              ? Colors.white70
                              : Colors.black54,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 6),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (todo.isBookmarked != true)
                            todoController.bookmark(todo.id ?? "");
                          else
                            todoController.removeBookmark(todo.id ?? "");
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                          decoration: BoxDecoration(
                            color: todo.isBookmarked != true
                                ? Colors.blue
                                : Colors.blue.shade800,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            todo.isBookmarked != true
                                ? 'Bookmark'
                                : 'Bookmarked',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      GestureDetector(
                        onTap: () {
                          if (todo.isCompleted == true) {
                            todoController.markPending(todo.id ?? "");
                          } else {
                            todoController.markComplete(todo.id ?? "");
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                          decoration: BoxDecoration(
                            color: todo.isCompleted == true
                                ? Colors.green
                                : Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            todo.isCompleted == true ? 'Completed ' : 'Pending',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  todo.isEdited == true
                      ? 'Updated: ${todo.updatedDate ?? "date"}'
                      : 'Created: ${todo.dateTime ?? "date"}',
                  style: TextStyle(
                    fontSize: 11,
                    color: utilityController.isDark == true
                        ? Colors.white70
                        : Colors.black54,
                  ),
                ),
                Text(
                  todo.isEdited == true
                      ? ' ${todo.updatedTime ?? "time stamp"}'
                      : ' ${todo.timeStamp ?? "time stamp"}',
                  style: TextStyle(
                    fontSize: 11,
                    color: utilityController.isDark == true
                        ? Colors.white70
                        : Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
