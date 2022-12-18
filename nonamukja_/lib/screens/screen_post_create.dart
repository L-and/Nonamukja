import 'package:flutter/material.dart';
import 'package:nonamukja/singleton_class/post.dart';



class PostCreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PostScrollView(),
    );
  }
}

Widget PostScrollView() {
  Post post = Post(); // 포스트 불러오기

  return CustomScrollView(
    slivers: <Widget>[
      SliverAppBar( // 게시글 이미지
        pinned: true,
        expandedHeight: 250.0,
        flexibleSpace: Stack(
          children: <Widget>[
          ],
        ),
      ),
      SliverToBoxAdapter( // 게시글 본문
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ],
          )
      ),
    ],
  );
}

Container BottomBar() {
  return Container(
    color: Colors.grey,
    height: 50,
    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
    child: Row(
      children: [
        Container(),
        Container(),
      ],
    ),
  );
}