import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

class EchartsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('echarts'),
      ),
      body: EchartsContent(),
    );
  }
}

class EchartsContent extends StatefulWidget {
  _EchartsContent createState() => _EchartsContent();
}

class _EchartsContent extends State<EchartsContent> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Echarts(
        option: '''
              {
                xAxis: {
                  type: 'category',
                  data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                },
                yAxis: {
                  type: 'value'
                },
                series: [{
                  data: [820, 932, 901, 934, 1290, 1330, 1320],
                  type: 'line'
                }]
              }
        ''',
      ),
      width: 300,
      height: 250,
    );
  }
}
