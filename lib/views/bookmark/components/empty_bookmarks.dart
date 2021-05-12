import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_todo_app/controllers/utility_controller.dart';

Widget emptyBookmarksTile(UtilityController utilityController) {
  return Container(
    padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
    height: 80,
    // color: Colors.black12,
    alignment: Alignment.center,
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
    child: Text(
      "Nothing to show in Bookmarks",
      style: TextStyle(
        fontSize: 18,
      ),
    ),
  );
}
