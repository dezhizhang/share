# app

### 无状态组件
```
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: Text('StatelessWidget'),
      ),
    );
  }
}
```
### 有状态组件
```
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(40),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Text('$count'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                child: Text('increment'),
                onPressed: () {
                  setState(() {
                    count = count + 1;
                  });
                }),
            SizedBox(height: 20),
            ElevatedButton(
                child: Text('decrement'),
                onPressed: () {
                  setState(() {
                    count = count - 1;
                  });
                })
          ],
        ),
      ),
    );
  }
}
```


