import 'package:flutter/material.dart';
import 'package:nonamukja/singleton_class/post.dart';

class PostScreenArguments {
  final int index;

  PostScreenArguments({required this.index});
}

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as PostScreenArguments;

    return Scaffold(
      body: PostScrollView(args.index),
    );
  }
}

Widget PostScrollView(int index) {
  Post post = Post(); // 포스트 불러오기

  return CustomScrollView(
    slivers: <Widget>[
      SliverAppBar( // 게시글 이미지
        pinned: true,
        expandedHeight: 250.0,
        flexibleSpace: Stack(
          children: <Widget>[
            Positioned.fill(
                child: Image.network(
                  'http://think2022.iptime.org:9900' + post.postModelList[index].photo,
                  fit: BoxFit.cover,
                )),
          ],
        ),
      ),
      SliverToBoxAdapter( // 게시글 본문
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.postModelList[index].title,  // 제목
              style: TextStyle(
                fontSize: 60,
              ),
            ),
            Text(post.postModelList[index].writer['nickname']!,  // 닉네임
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Text(post.postModelList[index].content,  // 내용
              style: TextStyle(
                fontSize: 25,
              ),
            ),
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