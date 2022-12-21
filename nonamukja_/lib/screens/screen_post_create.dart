import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:nonamukja/image_picker.dart';
import 'package:nonamukja/singleton_class/post.dart';

class PostCreateScreen extends StatelessWidget {
  MyImagePicker imagePicker = MyImagePicker(); // 이미지선택을 위한 변수

  // TextField들의 값을 사용하기 위한 컨트롤러
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _talkLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PostCreateAppBar(),
      body: PostCreateBody(),
    );
  }

  PostCreateAppBar() {
    return AppBar(
    );
  }

  PostCreateBody() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
        children: [
          IconButton(
              icon: Icon(Icons.photo),
              onPressed: () {
                imagePicker.SetImageFromGallery();
                print("이미지선택");
              },
          ),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: "글 제목",
            ),
          ),
          Divider(),
          TextField(
            controller: _contentController,
            decoration: InputDecoration(
              hintText: "글 내용",
            ),
              maxLines: 10,
              minLines: 10,
          ),
          Divider(),
          TextField(
            controller: _talkLinkController,
            decoration: InputDecoration(
              hintText: "채팅 URL",
            ),
          ),
          ElevatedButton(
            child: Text("완료"),
            onPressed: () {
              Post().photo = imagePicker.GetImage();
              Future<http.Response> statusCode = Post().postPostRequest(
                _titleController.text,
                _contentController.text,
                _talkLinkController.text,
              );

              statusCode.then((val) {
                print(val.statusCode);
              }).catchError((error) {
                print('[postCreater]'+error.toString());
              });
            },
          ),
        ],
      ),
      ),
    );
  }
}
