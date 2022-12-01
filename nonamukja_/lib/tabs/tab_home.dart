import 'package:flutter/material.dart';

final List<String> entries = <String>['A','B','C','D','E', 'F', 'G'];

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext, int index) {
        return PostContainer(index);
      },
    );
  }

  PostContainer(int index) { // 게시글 컨테이너 위젯
    return Container(
      height: 130,
      color: Colors.grey,
      margin: const EdgeInsets.symmetric(
        vertical: 5.0, // 마진 5px
      ),
      child: PostWidget('맘스터치 먹을사람~', '맘스터치', 1, 4, 4),
    );
  }

  Row PostWidget(String title, String restaurantName, int currentPeopleCount, int maxPeopleCount, int chatCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child:
          Image.asset(
            'test_image.webp',
            width: 100,),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(// 글제목
                title,
                style: TextStyle(fontSize: 18)),
            Text(// 가게이름
                restaurantName,
                style: TextStyle(fontSize: 15)),
            Text(// 인원정보
                currentPeopleCount.toString() + "/" + maxPeopleCount.toString() + "명",
                style: TextStyle(fontSize: 15)),
            Text(// 채팅개수
                chatCount.toString(),
                style: TextStyle(fontSize: 15))
          ],
        )
      ],
    );
  }
}
