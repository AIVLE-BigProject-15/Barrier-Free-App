// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'orderType.dart';
import 'file_upload.dart';

class CameraForAging extends StatefulWidget {
  const CameraForAging({super.key});

  @override
  State<CameraForAging> createState() => _CameraForAgingState();
}

class _CameraForAgingState extends State<CameraForAging> {
  File? _img;
  late String _img_path;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Future getImage(ImageSource imageSource) async{
      final pickedFile = await picker.pickImage(source: imageSource);

      setState(() {
        _img = File(pickedFile!.path);
        _img_path = pickedFile.path;
      });
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/',
              (route) => false,
            );
          },
          color: Color(0xffe51937),
          icon: Icon(Icons.arrow_back)
        ),
        elevation: 0.0,
        backgroundColor: Color(0xfff2f2f2),
        foregroundColor: Color(0xffe51937),
      ),
      backgroundColor: Color(0xfff2f2f2),
      body: Center(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Text(
                '얼굴을 알려주세요!\n맞춤 메뉴를 추천해드릴게요!', 
                style: TextStyle(
                  fontSize: 25, 
                  fontWeight: FontWeight.w800
                )
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(210, 50),
                  backgroundColor: Color(0xffffffff),
                  foregroundColor: Colors.black
                ),
                onPressed: () {
                  getImage(ImageSource.camera);
                }, 
                child: Text(
                  '카메라로 사진 찍기',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  )
                )
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(210, 50),
                  backgroundColor: Color(0xffffffff),
                  foregroundColor: Color(0xff000000)
                ),
                onPressed: () {
                  getImage(ImageSource.gallery);
                }, 
                child: Text(
                  '사진첩에서 가져오기',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ),
              SizedBox(height: 15,),
              showImage(),
              SizedBox(height: 15,),
            ],
          )
        ),
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
              fixedSize: Size(230, 50),
              backgroundColor: Color(0xffffffff),
              foregroundColor: Colors.black
            ),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const OrderType()));
              final _file_upload = FileApi();
              final bytes = await File(_img_path.toString()).readAsBytesSync();
              await _file_upload.uploadImage(bytes.buffer.asUint8List());
            },
            child: Text(
              '사진 선택 완료!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffe51937)
              ),
            )
          )
        ]
      );  
    }
  }
}