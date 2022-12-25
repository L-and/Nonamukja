import 'package:flutter/material.dart';
import 'package:nonamukja/screens/screen_post_modify.dart';
import 'package:nonamukja/singleton_class/post.dart';

enum MenuItem {modification, delete}

class PostScreenArguments {
  final int index;

  PostScreenArguments({required this.index});
}

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as PostScreenArguments;

    return Scaffold(
      body: PostScrollView(context, args.index),
    );
  }
}

Widget PostScrollView(context, int index) {
  Post post = Post(); // 포스트 불러오기

  MenuItem? selectedMenu;

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
        actions: [
          PopupMenuButton<MenuItem>(
            initialValue: selectedMenu ,
            // Callback that sets the selected popup menu item.
            onSelected: (MenuItem item) {
              if(item == MenuItem.modification) { // 수정
                Navigator.pushNamed(
                  context,
                  '/post_modify',
                  arguments: PostModifyScreenArguments(pk: post.postModelList[index].pk),
                );

              }
              else if(item == MenuItem.delete) { // 삭제
                Post().postDelete(post.postModelList[index].pk).then((value) => print(value));
                post.postListGetRequest().then((value) => null);
                Navigator.pop(context);
              }
            },
            itemBuilder: (context) => <PopupMenuEntry<MenuItem>>[
              const PopupMenuItem<MenuItem>(
                value: MenuItem.modification,
                child: Text('수정'),
              ),
              const PopupMenuItem<MenuItem>(
                value: MenuItem.delete,
                child: Text('삭제'),
              ),
            ],
          )
        ],
      ),
      SliverToBoxAdapter( // 게시글 본문
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.postModelList[index].title,  // 제목
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            Text("닉네임: "+post.postModelList[index].writer['nickname']!.toString(),  // 닉네임
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Divider(),
            SizedBox(
              height: 300,
              child: Text(post.postModelList[index].content,  // 내용
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Text(post.postModelList[index].talk_link,  // 톡 링크
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