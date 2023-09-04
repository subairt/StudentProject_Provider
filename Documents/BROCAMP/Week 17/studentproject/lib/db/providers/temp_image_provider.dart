import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TempImageProvider extends ChangeNotifier{
  String? tempImagePath;

  Future<void>getImage()async{
    final image = await ImagePicker().pickImage(source:ImageSource.gallery);
    if(image == null){
      return;
    }
    final imageTemporary = File(image.path);
    tempImagePath = imageTemporary.path;
    notifyListeners();
  }
  void notify(){
    notifyListeners();
  }
}