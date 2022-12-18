import 'package:flutter/material.dart';
import 'package:nonamukja/tabs/tab_chat.dart';
import 'package:nonamukja/tabs/tab_home.dart';
import 'package:nonamukja/tabs/tab_profile.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    HomeTab(),
    ChatTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기숙사'),
        actions: <Widget> [
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed('/search');
            },
          )
        ]
      ),
      floatingActionButton: _currentIndex == 0 ? FloatingActionButton( // 게시글 생성버튼
        onPressed: () {
          Navigator.of(context).pushNamed('/post_create');
        },
        child: Icon(Icons.add),
      ) : null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontSize: 12),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 1) {
            setState(() {
              _currentIndex = 1;
            });
          }
          else if (index == 2) {
            setState(() {
              _currentIndex = 2;
            });
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: '채팅'),
          BottomNavigationBarItem(icon: Icon(Icons.man), label: '내 정보'),
        ],
      ),
      body: _tabs[_currentIndex],
    );
  }
}