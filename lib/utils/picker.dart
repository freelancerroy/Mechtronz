import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mechtronz/constants/app_colors.dart';

Future<List<File>?> imagePicker(int limit) async {
  ImageSource? source;
  await Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.w),
          topRight: Radius.circular(8.w),
        ),
      ),
      child: Wrap(
        children: <Widget>[
          ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Photo Library'),
              onTap: () {
                source = ImageSource.gallery;
                Get.back();
              }),
          const Divider(color: AppColors.gray200),
          ListTile(
            leading: const Icon(Icons.photo_camera),
            title: const Text('Camera'),
            onTap: () {
              source = ImageSource.camera;
              Get.back();
            },
          ),
        ],
      ),
    ),
  );

  if (source != null) {
    final picker = ImagePicker();
    if (source == ImageSource.camera) {
      final pickedFile =
          await picker.pickImage(source: source!, imageQuality: 80);
      if (pickedFile != null) {
        return [File(pickedFile.path)];
      }
    } else {
      if (limit == 1) {
        final pickedFile =
            await picker.pickImage(source: source!, imageQuality: 80);
        if (pickedFile != null) {
          return [File(pickedFile.path)];
        }
      }
      final pickedFile =
          await picker.pickMultiImage(imageQuality: 80, limit: limit);
      if (pickedFile.length > limit) {
        Fluttertoast.showToast(msg: 'You can only select 5 images');
        return pickedFile.sublist(0, limit).map((e) => File(e.path)).toList();
      }
      if (pickedFile.isNotEmpty) {
        return pickedFile.map((e) => File(e.path)).toList();
      }
    }
  }
  return null;
}
