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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                  'test_image.webp',
              width: ,),
              Text(// 글제목
                '맘스터치 먹을사람~',
              style: TextStyle(fontSize: 18)),
              Text(// 가게이름
                  '맘스터치',
                  style: TextStyle(fontSize: 18)),
              Text(// 인원정보
                  '1/4명',
                  style: TextStyle(fontSize: 18)),
              Text(// 채팅개수
                  '4',
                  style: TextStyle(fontSize: 18))
            ],
          )
        ],
      ),

    );
  }

}
