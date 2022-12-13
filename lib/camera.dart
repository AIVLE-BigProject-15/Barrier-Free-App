// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CameraForAging extends StatefulWidget {
  const CameraForAging({super.key});

  @override
  State<CameraForAging> createState() => _CameraForAgingState();
}

class _CameraForAgingState extends State<CameraForAging> {
  File? _img;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Future getImage(ImageSource imageSource) async{
      final pickedFile = await picker.pickImage(source: imageSource);

      setState(() {
        _img = File(pickedFile!.path);
      });
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('얼굴을 알려주세요!\n맞춤 메뉴를 추천해드릴게요!😁😀'),
            ElevatedButton(
              onPressed: () {
                getImage(ImageSource.camera);
              }, 
              child: Text('카메라로 사진 찍기')
            ),
            ElevatedButton(
              onPressed: () {
                getImage(ImageSource.gallery);
              }, 
              child: Text('사진첩에서 가져오기')
            ),
            showImage(),
          ],
        )
      ),
    );
  }
  Widget showImage(){
    if(_img == null){
      return Container();
    } else {
      return Image.file(_img!);
    }
  }
}