import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

snackbarErro(String message) {
  Get.snackbar("", "",
      titleText: Text(
        message,
        style: const TextStyle(
          color: textColorWhite,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      messageText: const Visibility(
        visible: false,
        child: Text(''),
      ),
      icon: const Icon(
        Icons.error,
        color: textColorWhite,
        size: 30,
      ),
      shouldIconPulse: false,
      backgroundColor: error,
      padding: const EdgeInsets.only(top: 10, bottom: 4),
      borderRadius: 4,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          spreadRadius: 0,
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ]);
}
