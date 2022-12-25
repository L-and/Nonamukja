import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:nonamukja/image_picker.dart';
import 'package:nonamukja/singleton_class/post.dart';
import 'package:nonamukja/model/post_model.dart';

class PostModifyScreenArguments {
  final int pk;

  PostModifyScreenArguments({required this.pk});
}

class PostModifyScreen extends StatelessWidget {
  MyImagePicker imagePicker = MyImagePicker(); // 이미지선택을 위한 변수

  // TextField들의 값을 사용하기 위한 컨트롤러
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _talkLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PostModifyScreenArguments;

    Future<PostModel> futurePostModel = Post().postLoadWithPK(args.pk);

    PostModel postModel = PostModel.Initial();

    futurePostModel.then((val) {
      print("post모델 불러오기 성공");
      postModel = val;

      _titleController.text = postModel.title;
      _contentController.text = postModel.content;
      _talkLinkController.text = postModel.talk_link;
    }).catchError((error) {
      print(error);
    });

    return Scaffold(
      appBar: PostCreateAppBar(),
      body: PostCreateBody(context, args.pk),
    );
  }

  PostCreateAppBar() {
    return AppBar(
    );
  }

  PostCreateBody(context, pk) {
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
                Future<http.Response> statusCode = Post().postModifyRequest(
                  pk,
                  _titleController.text,
                  _contentController.text,
                  _talkLinkController.text,
                );

                statusCode.then((val) {
                  print(val.statusCode);
                  if(val.statusCode ~/ 100 == 2) {
                    Navigator.pop(context);
                  }
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
