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
  List<Widget> list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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

  handleAdd() {
    list.add(Text('2'));
    setState(() {
      list = list;
    });
  }

  Widget buildText() {
    Widget countent;
    for (var i = 0; i < list.length; i++) {
      list.add(Text('$i'));
    }
    countent = Row(
      children: list,
    );
    return countent;
  }

  @override
  Widget build(BuildContext context) {
    print('------');
    print(count);
    print('------');
    print(list);
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Text('$count'),
          ),
          Center(
            child: ElevatedButton(
              child: Text('increment'),
              onPressed: () {
                setState(() {
                  count = count + 1;
                });
              },
            ),
          ),
          SizedBox(height: 10),
          buildText(),
        ],
      ),
    );
  }
}
