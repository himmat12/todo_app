import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simple_todo_app/controllers/todo_controller.dart';
import 'package:simple_todo_app/controllers/utility_controller.dart';
import 'package:simple_todo_app/models/todo_model.dart';

import '../../../global_components/get_snackbar.dart';

class ToDoComponent extends StatelessWidget {
  final ToDoModel todo;
  ToDoComponent({Key? key, required this.todo}) : super(key: key);
  final todoController = Get.find<TodoController>();
  final utilityController = Get.find<UtilityController>();
  final _key = GlobalKey<FormState>();
  final title = TextEditingController();
  final body = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo Deatils'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text('Created: ${todo.dateTime}'),
                trailing: Text('${todo.timeStamp}'),
              ),
              Divider(),
              if (todoController.isEditModeEnabled != true)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title ?? "title",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 14),
                    Text(
                      todo.body ?? "body",
                      style: TextStyle(
                        fontSize: 18,
                        color: utilityController.isDark == true
                            ? Colors.white70
                            : Colors.black54,
                      ),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                              decoration: BoxDecoration(
                                color: todo.isCompleted == true
                                    ? Colors.green
                                    : Colors.red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                todo.isCompleted == true
                                    ? 'Completed '
                                    : 'Pending',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Container(
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
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              todoController.toggleEditMode();
                            },
                            child: Text('Edit')),
                      ],
                    ),
                  ],
                )
              else
                Container(
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        TextFormField(
                          // initialValue: todo.title,
                          validator: (value) {
                            if (value == null || value.isBlank!) {
                              return "required field";
                            }
                            return null;
                          },
                          controller: title..text = todo.title ?? "",
                          maxLength: 50,
                          maxLengthEnforcement: MaxLengthEnforcement.none,
                          onChanged: (value) {
                            if (value.length >= 50) {
                              getSnackbar(
                                  message: 'maximum characters length is 50');
                            }
                          },
                          decoration: InputDecoration(hintText: 'Title'),
                        ),
                        TextFormField(
                          // initialValue: todo.body,
                          validator: (value) {
                            if (value == null || value.isBlank!) {
                              return "required field";
                            }
                          },
                          controller: body..text = todo.body ?? "",
                          maxLines: 4,

                          decoration: InputDecoration(
                            hintText: 'Body',
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Wrap(
                            //   children: [
                            //     GestureDetector(
                            //       onTap: () {
                            //         if (todo.isCompleted == true) {
                            //           todoController.markPending(todo.id ?? "");
                            //         } else {
                            //           todoController
                            //               .markComplete(todo.id ?? "");
                            //         }
                            //       },
                            //       child: Container(
                            //         alignment: Alignment.center,
                            //         padding:
                            //             const EdgeInsets.fromLTRB(4, 4, 4, 4),
                            //         decoration: BoxDecoration(
                            //           color: todo.isCompleted == true
                            //               ? Colors.green
                            //               : Colors.red,
                            //           borderRadius: BorderRadius.circular(6),
                            //         ),
                            //         child: Text(
                            //           todo.isCompleted == true
                            //               ? 'Completed '
                            //               : 'Pending',
                            //           style: TextStyle(
                            //             color: Colors.white,
                            //             fontSize: 12,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     SizedBox(width: 4),
                            //     GestureDetector(
                            //       onTap: () {
                            //         if (todo.isBookmarked != true)
                            //           todoController.bookmark(todo.id ?? "");
                            //         else
                            //           todoController
                            //               .removeBookmark(todo.id ?? "");
                            //       },
                            //       child: Container(
                            //         alignment: Alignment.center,
                            //         padding:
                            //             const EdgeInsets.fromLTRB(4, 4, 4, 4),
                            //         decoration: BoxDecoration(
                            //           color: todo.isBookmarked != true
                            //               ? Colors.blue
                            //               : Colors.blue.shade800,
                            //           borderRadius: BorderRadius.circular(6),
                            //         ),
                            //         child: Text(
                            //           todo.isBookmarked != true
                            //               ? 'Bookmark'
                            //               : 'Bookmarked',
                            //           style: TextStyle(
                            //             color: Colors.white,
                            //             fontSize: 12,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),

                            Wrap(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      if (_key.currentState!.validate()) {
                                        // _id = UniqueKey().toString();

                                        ToDoModel _todo;
                                        _todo = ToDoModel(
                                          id: todo.id,
                                          title: title.text,
                                          body: body.text,
                                          updatedDate: DateFormat.yMMMMd()
                                              .format(DateTime.now()),
                                          updatedTime: DateFormat()
                                              .add_jm()
                                              .format(DateTime.now()),
                                        );

                                        todoController.updateToDo(_todo);

                                        // Get.back();
                                        getSnackbar(
                                            message: 'todo updated',
                                            bgColor: Colors.green,
                                            leadingIcon: Icons.done_all);
                                      } else {
                                        getSnackbar(
                                            message: 'required field',
                                            bgColor: Colors.red,
                                            leadingIcon: Icons.warning_rounded);
                                      }
                                    },
                                    child: Text('Save')),
                                TextButton(
                                    onPressed: () {
                                      // Get.back();
                                      todoController.toggleEditMode();
                                    },
                                    child: Text('Cancle')),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
