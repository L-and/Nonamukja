import 'package:flutter/material.dart';
import 'package:nonamukja/singleton_class/post.dart';
import 'package:nonamukja/model/post_model.dart';
import 'package:nonamukja/screens/screen_post.dart';

class HomeTab extends StatelessWidget {
  Post post = Post();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: post.postListGetRequest(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData == false) {
          return CircularProgressIndicator();
        }
        else if (snapshot.hasError) {
          return Text("로딩에러!");
        }
        else {
          print("PostData 로딩 성공!");
          print(snapshot.data);
          return ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(8),
            itemCount: post.postCount,
            itemBuilder: (BuildContext, int index) {
              var image;
              try {
                image = Image.network('http://think2022.iptime.org:9900' +
                    snapshot.data[index].photo); // 이미지 불러오기
              }
              catch(e){
                print(e);
                image = Text("로딩에러");
              }
              return ListTile(
                leading: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    width: 100,
                    height: 100,
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    alignment: Alignment.center,
                    child: image,
                  ),
                ),

                title: Text(snapshot.data[index].title),
                dense: false,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/post',
                    arguments: PostScreenArguments(index: index),
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
