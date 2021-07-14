import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UploadBlogController extends GetxController {
  //Pick Image use library image_picker from pub.dev
  File? image;
  final picker = ImagePicker();

  File? file;

  Future checkStatus({required Function showModal}) async {
    var cameraStatus = await Permission.camera.status;
    var storageStatus = await Permission.storage.status;

    if (!cameraStatus.isGranted) {
      await Permission.camera.request();
    }
    if (!cameraStatus.isGranted) {
      await Permission.storage.request();
    }
    if (cameraStatus.isGranted && storageStatus.isGranted) {
      showModal();
    } else {
      Get.snackbar(
        'Note',
        'You is denined all permisson will go to settings to granted',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(milliseconds: 3000),
        mainButton: TextButton(
          onPressed: () {
            openAppSettings();
          },
          child: Text('GO'),
        ),
      );
    }
  }

  //Function used to connect camera to pick image
  Future<void> pickImageFromCamera() async {
    final pickerImage = await picker.getImage(source: ImageSource.camera);
    if (pickerImage != null) {
      image = File(pickerImage.path);
      Get.back();
    } else {
      print('No image selected');
    }
    update();
  }

  //Function used to connect gallery to pick image
  Future<void> pickImageFromGallery() async {
    final pickerImage = await picker.getImage(source: ImageSource.gallery);
    if (pickerImage != null) {
      image = File(pickerImage.path);
      Get.back();
    } else {
      print('No image selected');
    }
    update();
  }

  //Function used to remove image
  void removeImage() {
    image = null;
    Get.back();
    update();
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);
      Get.back();
    } else {
      print('No selected File');
    }
    update();
  }

  void removeFile() {
    file = null;
    Get.back();
    update();
  }
}
