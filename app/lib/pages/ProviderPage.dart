import 'package:app/pages/Counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('状态管理'),
      ),
      body: ProviderContent(),
    );
  }
}

class ProviderContent extends StatefulWidget {
  _ProviderContent createState() => _ProviderContent();
}

class _ProviderContent extends State<ProviderContent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('-------------');
    print('initState');
    print('-------------');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('-----------');
    print('dispose');
    print('----------');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    var counterProver = Provider.of<Counter>(context);
    //  var cartProvider = Provider.of<Cart>(context);
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: <Widget>[
            Text('${counterProver.count}'),
            ElevatedButton(
                onPressed: () {
                  counterProver.incCount();
                },
                child: Text('增加'))
          ],
        ),
      ),
    );
  }
}
