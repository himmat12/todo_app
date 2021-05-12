import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo_app/controllers/todo_controller.dart';
import 'package:simple_todo_app/controllers/utility_controller.dart';
import 'package:simple_todo_app/models/todo_model.dart';
import 'package:simple_todo_app/views/todos/components/todo_component.dart';

Widget bookmarkTile(ToDoModel todo) {
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
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        // color: Colors.black12,
        decoration: BoxDecoration(
          color: utilityController.isDark == true
              ? Colors.grey.shade700
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
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
                      // SizedBox(height: 4),
                      // Text(
                      //   todo.body ?? "",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.w400,
                      //     fontSize: 16,
                      //     color: utilityController.isDark == true
                      //         ? Colors.white70
                      //         : Colors.black54,
                      //   ),
                      //   maxLines: 2,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
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
                          todoController.removeBookmark(todo.id ?? "id");
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'Remove',
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

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       'Created: ${todo.dateTime ?? "date"}',
            //       style: TextStyle(
            //         fontSize: 11,
            //         color: utilityController.isDark == true
            //             ? Colors.white70
            //             : Colors.black54,
            //       ),
            //     ),
            //     Text(
            //       ' ${todo.timeStamp ?? "time stamp"}',
            //       style: TextStyle(
            //         fontSize: 11,
            //         color: utilityController.isDark == true
            //             ? Colors.white70
            //             : Colors.black54,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    ),
  );
}
