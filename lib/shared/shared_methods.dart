import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:layanan/shared/theme.dart';

void showCustomSnackbar(BuildContext context, String message) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    duration: const Duration(seconds: 2),
  ).show(context);
}

Future<XFile?> selectImage() async {
  XFile? selectedImage = await ImagePicker().pickImage(
    source: ImageSource.gallery,
  );
  return selectedImage;
}
