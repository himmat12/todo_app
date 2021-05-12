import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_todo_app/controllers/category_controller.dart';

import 'package:simple_todo_app/controllers/todo_controller.dart';
import 'package:simple_todo_app/global_components/get_snackbar.dart';
import 'package:simple_todo_app/models/todo_model.dart';

import 'package:intl/intl.dart';

class CreateToDo extends StatelessWidget {
  final todoController = Get.find<TodoController>();
  final _key = GlobalKey<FormState>();
  final title = TextEditingController();
  final body = TextEditingController();
  late final String _id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create ToDo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(
                          'Date: ${DateFormat.yMMMMd().format(DateTime.now())}'),
                    ),
                    //   Obx(
                    //     () => DropdownButtonFormField(
                    //       onTap: () {},
                    //       validator: (value) {
                    //         if (value == null || value.isBlank!) {
                    //           return "required field";
                    //         }
                    //         return null;
                    //       },
                    //       isExpanded: true,
                    //       onChanged: (String? value) {
                    //         todoController.setSelectedValue(value);
                    //       },
                    //       value: categories[0].id,
                    //       items: categories
                    //           .map((e) =>
                    //               DropdownMenuItem(value: e.id!, child: Text(e.title!)))
                    //           .toList(),
                    //     ),
                    //   ),
                    // //
                    TextFormField(
                      // validator: (value) {
                      //   if (value == null || value.isBlank!) {
                      //     return "required field";
                      //   }
                      //   return null;
                      // },
                      controller: title,
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
                      validator: (value) {
                        if (value == null || value.isBlank!) {
                          return "required field";
                        }
                      },
                      controller: body,
                      maxLines: 4,
                      decoration: InputDecoration(hintText: 'Body'),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              // if (_key.currentState!.validate()) {
                              _id = UniqueKey().toString();

                              ToDoModel todo;
                              todo = ToDoModel(
                                id: _id,
                                title: title.text,
                                body: body.text,
                                timeStamp: DateFormat()
                                    .add_jm()
                                    .format(DateTime.now()),
                                dateTime:
                                    DateFormat.yMMMMd().format(DateTime.now()),
                              );

                              todoController.addTodo(todo);
                              Get.back();
                              getSnackbar(
                                  message: 'todo created',
                                  bgColor: Colors.green,
                                  leadingIcon: Icons.done_all);
                              // } else {
                              //   getSnackbar(
                              //       message: 'required field',
                              //       bgColor: Colors.red,
                              //       leadingIcon: Icons.warning_rounded);
                              // }
                            },
                            child: Text('Save')),
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('Cancle')),
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
    );
  }
}
