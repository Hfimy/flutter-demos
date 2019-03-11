import 'package:flutter/material.dart';

import './tab_body.dart';

class _TabData {
  final Widget tab;
  final Widget body;
  _TabData({this.tab, this.body});
}

final _tabDataList = <_TabData>[
  _TabData(tab: Text('推荐'), body: TabBody(title: '推荐')),
  _TabData(tab: Text('VIP'), body: TabBody(title: 'VIP')),
  _TabData(tab: Text('小说'), body: TabBody(title: '小说')),
  _TabData(tab: Text('直播'), body: TabBody(title: '直播'))
];

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final tabBarList = _tabDataList.map((item) => item.tab).toList();
  final tabBarViewList = _tabDataList.map((item) => item.body).toList();

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: _tabDataList.length);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
            bottom: TabBar(
              tabs: tabBarList,
              controller: tabController,
            )),
        body: TabBarView(
          children: tabBarViewList,
          controller: tabController,
          // physics: NeverScrollableScrollPhysics(), // 禁止滑动
        ));
  }
}
