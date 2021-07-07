import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('表格'),
      ),
      body: TableContent(),
    );
  }
}

class TableContent extends StatefulWidget {
  _TableContent createState() => _TableContent();
}

class _TableContent extends State<TableContent> {
  List list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.loadData();
  }

  loadData() async {
    String url = 'http://127.0.0.1:7001/api/table/list';
    var response = await Dio().get(url);
    var data = json.decode(response.toString());
    if (data['code'] == 200) {
      setState(() {
        list = data['data'];
      });
    }
  }

  _tableRowList() {
    var count = list.length;
    dynamic content;
    // ignore: non_constant_identifier_names
    List<TableRow> Tlist = <TableRow>[
      TableRow(children: [
        TableCell(child: Text('姓名')),
        TableCell(child: Text('年龄')),
        TableCell(child: Text('性别')),
        TableCell(child: Text('电话')),
        TableCell(child: Text('地址')),
      ])
    ];
    for (var i = 0; i < count; i++) {
      content = TableRow(children: [
        TableCell(child: Text(list[i]['name'].toString())),
        TableCell(child: Text(list[i]['age'].toString())),
        TableCell(child: Text(list[i]['sex'].toString())),
        TableCell(child: Text(list[i]['phone'].toString())),
        TableCell(child: Text(list[i]['address'].toString())),
      ]);
      Tlist.add(content);
    }
    return Tlist;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Table(
      children: _tableRowList(),
    );
  }
}
