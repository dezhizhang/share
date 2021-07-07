import 'package:flutter/material.dart';

class LifeCyclePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('生命周期'),
      ),
      body: LifeCycleContent(),
    );
  }
}

class LifeCycleContent extends StatefulWidget {
  _LifeCycleContent createState() => _LifeCycleContent();
}

class _LifeCycleContent extends State<LifeCycleContent> {
  int count = 0;
  List<int> list = [1];
  GlobalKey key = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('-----------');
    print('initState1');
    print('-----------');
    setState(() {
      count = 1;
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('--------------------');
    print('didChangeDependencies');
    print('---------------------');
  }

  @override
  void didUpdateWidget(covariant LifeCycleContent oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('-------------');
    print('didUpdateWidget');
    print('-------------');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('----------');
    print('deactivate');
    print('----------');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('-------------');
    print('dispose');
    print('-------------');
  }

  handleList() {
    List list = [];
    list.add(1);
    this.setState(() {
      list = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('------');
    print(count);
    print('------');
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              '$count',
              key: key,
            ),
          ),
          Center(
              child: ElevatedButton(
            child: Text('increment'),
            onPressed: () {
              setState(() {
                count = count + 1;
              });
            },
          )),
          //ListContent(count: count),
          //ElevatedButton(onPressed: this.handleList, child: Text('减少')),
        ],
      ),
    );
  }
}

class ListContent extends StatefulWidget {
  int count;
  ListContent({Key? key, required this.count}) : super(key: key);
  _ListContent createState() => _ListContent();
}

class _ListContent extends State<ListContent> {
  @override
  void didUpdateWidget(covariant ListContent oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('-------------');
    print('didUpdateWidget');
    print('-------------');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('-------------');
    print('initState2');
    print('--------------');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('------------------');
    print('dispose');
    print('------------------');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text('${widget.count}'),
    );
  }
}
