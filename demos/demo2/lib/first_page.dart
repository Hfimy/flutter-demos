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

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
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
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 80,
          padding: EdgeInsets.fromLTRB(20, 24, 0, 0),
          alignment: Alignment.centerLeft,
          color: Colors.black,
          child: TabBar(
            isScrollable: true,
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.white,
            unselectedLabelStyle: TextStyle(fontSize: 18),
            labelColor: Colors.red,
            labelStyle: TextStyle(fontSize: 20),
            tabs: tabBarList,
            controller: tabController,
          ),
        ),
        Expanded(
          child: TabBarView(
            children: tabBarViewList,
            controller: tabController,
          ),
        )
      ],
    );
  }
}
