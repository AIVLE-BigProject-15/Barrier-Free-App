// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'orderType.dart';

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
      appBar: AppBar(
        
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Text(
              '얼굴을 알려주세요!\n맞춤 메뉴를 추천해드릴게요!😁😀', 
              style: TextStyle(
                fontSize: 25, 
                fontWeight: FontWeight.bold
              )
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
              ),
              onPressed: () {
                getImage(ImageSource.camera);
              }, 
              child: Text(
                '카메라로 사진 찍기',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )
              )
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50)
              ),
              onPressed: () {
                getImage(ImageSource.gallery);
              }, 
              child: Text(
                '사진첩에서 가져오기',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ),
            // SizedBox(height: 15,),
            showImage(),
            // SizedBox(height: 15,),
          ],
        )
      ),
    );
  }
  Widget showImage(){
    if(_img == null){
      return Container();
    } else {
      return Column(
        children: [
          Image.file(
            _img!, 
            width: 300.0, 
            height: 200.0,
          ),
          SizedBox(height: 10,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
              ),
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const OrderType()
                  )
                );
              }, 
              child: Text(
                '사진 선택 완료!',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                ),
              )
            )

        ]
      );
          
    }
  }
}