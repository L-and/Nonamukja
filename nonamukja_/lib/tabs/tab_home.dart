import 'package:flutter/material.dart';
import 'package:nonamukja/singleton_class/post.dart';
import 'package:nonamukja/model/post_model.dart';
import 'package:nonamukja/screens/screen_post.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTab createState() => _HomeTab();
}

class _HomeTab extends State<HomeTab>{
  Post post = Post();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: post.postListGetRequest(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print(snapshot.connectionState);
        if (snapshot.connectionState != ConnectionState.done) {
          post.postListGetRequest();
        }

        if (snapshot.hasData == false) {
          return CircularProgressIndicator();
        }
        else if (snapshot.hasError) {
          return Text("로딩에러!");
        }
        else {
          print("PostData 로딩 성공!");
          // print(snapshot.data);
          return ListView.separated(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: post.postCount,
            itemBuilder: (BuildContext, int index) {
              return PostWidget(context, snapshot, index);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(height: 1, color: Colors.black.withOpacity(0.3));
            },
          );
        }
      },
    );
  }

  PostWidget(context, snapshot, index) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/post',
          arguments: PostScreenArguments(index: index),
        ).then((val) {
          setState((){});
        });
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.network('http://think2022.iptime.org:9900' + snapshot.data[index].photo,
                  width: 100,
                  height: 100,
                ),
              ),
              Expanded(
                child: Container(

                  height: 100,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data[index].title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20),),
                      SizedBox(height: 5),
                      Text(
                        snapshot.data[index].writer['nickname'],
                        style: TextStyle(fontSize: 15, color: Colors.grey),),
                    ],
                  ),
                ),
              )
            ],
          )
        ),
    );
  }
}
