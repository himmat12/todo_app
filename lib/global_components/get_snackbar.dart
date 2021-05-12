import 'package:flutter/material.dart';
import 'package:get/get.dart';

void getSnackbar({String? message, Color? bgColor, IconData? leadingIcon}) =>
    Get.showSnackbar(GetBar(
      onTap: (value) {
        Get.back();
      },
      duration: Duration(milliseconds: 1600),
      message: message ?? "message",
      animationDuration: Duration(milliseconds: 600),
      isDismissible: true,
      shouldIconPulse: false,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
      icon: Icon(
        leadingIcon ?? Icons.info_outline,
        color: Colors.white,
      ),
      backgroundColor: bgColor ?? Colors.blue,
    ));
