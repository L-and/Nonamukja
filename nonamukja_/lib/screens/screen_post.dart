import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PostBody(context),
    );
  }
}

Widget PostBody(context) {
  return CustomScrollView(
    slivers: <Widget>[
      const SliverAppBar(
        pinned: true,
        expandedHeight: 250.0,
        flexibleSpace: FlexibleSpaceBar(
          title: Text('Demo'),
        ),
      ),
      SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 4.0,
        ),
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.teal[100 * (index % 9)],
              child: Text('Grid Item $index'),
            );
          },
          childCount: 20,
        ),
      ),
      SliverFixedExtentList(
        itemExtent: 50.0,
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index % 9)],
              child: Text('List Item $index'),
            );
          },
        ),
      ),
      BottomBar(),
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