import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostCreateScreen extends StatelessWidget {
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
      child: Column(
        children: [
          Icon(Icons.photo),
        ],
      ),
    );
  }
}
