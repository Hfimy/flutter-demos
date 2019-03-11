import 'package:flutter/material.dart';

import './first_page.dart';
import './second_page.dart';

class _PageData {
  final Widget icon;
  final Widget title;
  final Widget body;
  _PageData({this.icon, this.title, this.body});
}

final _pageData = <_PageData>[
  _PageData(icon: Icon(Icons.home), title: Text('首页'), body: FirstPage()),
  _PageData(icon: Icon(Icons.message), title: Text('消息'), body: SecondPage()),
];

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final items = _pageData
      .map(
          (item) => BottomNavigationBarItem(icon: item.icon, title: item.title))
      .toList();

  final bodyList = _pageData.map((item) => item.body).toList();

  final pageController = PageController();

  int currentIndex = 0;

  void onTap(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: items,
          currentIndex: currentIndex,
          onTap: onTap,
        ),
        // 1. IndexedStack实现页面切换保持原页面状态
        // body: IndexedStack(
        //   index: currentIndex,
        //   children: bodyList,
        // ),
        // 2. Offstage实现页面切换保持原页面状态
        // body: Stack(
        //   children: <Widget>[
        //     Offstage(
        //       offstage: currentIndex != 0,
        //       child: bodyList[0],
        //     ),
        //     Offstage(
        //       offstage: currentIndex != 1,
        //       child: bodyList[1],
        //     )
        //   ],
        // ),
        // PageView + AutomaticKeepAliveClientMixin 实现保持页面状态
        body: PageView(
          controller: pageController,
          children: bodyList,
          onPageChanged: onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ));
  }
}
