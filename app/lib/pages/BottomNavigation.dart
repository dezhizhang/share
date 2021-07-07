import 'package:flutter/material.dart';

class BottomNavigationPage extends StatefulWidget {
  _BottomNavigationPage createState() => _BottomNavigationPage();
}

class _BottomNavigationPage extends State<BottomNavigationPage> {
  int currentIndex = 0;
  Widget _currentBody = Container(
    child: Text('我是首页'),
  );
  _bottomNavigationChange(int index) {
    print(index);
    switch (index) {
      case 0:
        setState(() {
          currentIndex = index;
          _currentBody = Text('我是第一页');
        });

        break;
      case 1:
        setState(() {
          currentIndex = index;
          _currentBody = Text('我是第二页');
        });
        break;
      case 2:
        setState(() {
          currentIndex = index;
          _currentBody = Text('我是第三页');
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationPage'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _bottomNavigationChange,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.grade), label: '群组'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的')
        ],
      ),
      body: _currentBody,
    );
  }
}
