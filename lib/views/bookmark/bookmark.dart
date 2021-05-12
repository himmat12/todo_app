import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo_app/controllers/todo_controller.dart';
import 'package:simple_todo_app/controllers/utility_controller.dart';
import 'package:simple_todo_app/models/todo_model.dart';
import 'package:simple_todo_app/views/bookmark/components/empty_bookmarks.dart';

import '../todos/components/todo_tile.dart';
import 'components/bookmark_tile.dart';

class BookmarkPage extends StatelessWidget {
  final TodoController controller = Get.find();
  final UtilityController utilityController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: "bookmarks",
      init: controller,
      initState: (_) {
        controller.getBookmarks();
      },
      builder: (_) {
        return controller.bookmarksList.length == 0
            ? Obx(
                () => emptyBookmarksTile(utilityController),
              )
            : Column(
                children: [
                  Obx(
                    () => ListView.separated(
                      reverse: true,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.bookmarksList.length,
                      itemBuilder: (context, index) {
                        ToDoModel todo = controller.bookmarksList[index];

                        return bookmarkTile(todo);
                      },
                    ),
                  )
                ],
              );
      },
    );
  }
}
