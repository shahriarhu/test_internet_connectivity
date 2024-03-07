import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

void simpleNotificationWidget({
  int? statusCode,
  required String message,
}) {
  Color color = Colors.transparent;

  int timeInSecond = 3;
  if (statusCode == null) {
    color = Colors.orangeAccent;
  } else if (200 <= statusCode && statusCode < 300) {
    color = Colors.greenAccent;
  } else if (400 <= statusCode && statusCode < 500) {
    color = Colors.redAccent;
  } else if (500 <= statusCode && statusCode < 600) {
    color = Colors.orangeAccent;
  }

  if (message.length <= 50) {
    timeInSecond = 4;
  } else if (50 < message.length && message.length <= 100) {
    timeInSecond = 5;
  } else if (100 < message.length && message.length <= 200) {
    timeInSecond = 6;
  } else {
    timeInSecond = 1;
  }

  BotToast.showSimpleNotification(
    title: message,
    backgroundColor: color,
    crossPage: true,
    titleStyle: const TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    hideCloseButton: false,
    closeIcon: const Icon(
      Icons.cancel,
      color: Colors.white,
    ),
    duration: Duration(seconds: timeInSecond),
    borderRadius: 12.0,
  );
}
