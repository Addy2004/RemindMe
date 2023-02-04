library snackbar;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void go() {
  // Simple snackbar
  snack("Hello World",) ;

  // Snack with a button
  snackUndo("Deleted XYZ", () {
    // It was NOT undone, proceed with deletion
  }, undoText: "Undo", duration: const Duration(milliseconds: 50));

  // Clear the current snackbar
  clearSnackbar();
}

void snack(String message) => ScaffoldMessenger.of(Get.context!)
    .showSnackBar(SnackBar(content: Text(message)));

void snackUndo(String message, VoidCallback didNotUndo,
    {String undoText = "Dismis",
      Duration duration = const Duration(milliseconds: 50)}) {
  bool undid = false;
  Duration waitDuration =
  Duration(milliseconds: duration.inMilliseconds + 500);
  SnackBar sb = SnackBar(
      content: Text(message),
      action: SnackBarAction(label: undoText, onPressed: () => undid = true),
      onVisible: () => Future.delayed(waitDuration, () {
        if (!undid) {
          didNotUndo();
        }
      }));
  ScaffoldMessenger.of(Get.context!).showSnackBar(sb);
}

void clearSnackbar() => ScaffoldMessenger.of(Get.context!).clearSnackBars();
