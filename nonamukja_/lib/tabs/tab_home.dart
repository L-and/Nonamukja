import 'package:flutter/material.dart';


class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(8),
      itemCount: 30,
      itemBuilder: (BuildContext, int index) {
        return PostListTile(context, index);
      },
    );
  }

  PostListTile(BuildContext context , int index) { // 게시글 리스트타이틀 위젯
    return ListTile(
      leading: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Container(
          width: 128,
          height: 128,
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          alignment: Alignment.center,
          child: CircleAvatar(),
        ),
      ),
      title: const Text('맘스터치 먹을사람~'),
      dense: false,
      onTap: () {
        Navigator.of(context).pushNamed('/post');
      },
    );
  }
}
