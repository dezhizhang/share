import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FromPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('FORM表单'),
      ),
      body: FromContent(),
    );
  }
}

class FromContent extends StatefulWidget {
  _FromContent createState() => _FromContent();
}

class _FromContent extends State<FromContent> {
  String name = '';
  String age = '';
  String sex = '';
  String phone = '';
  String hobby = '';
  String address = '';
  final _formKey = GlobalKey<FormState>();

  handleOk() async {
    Map<String, dynamic> map = Map();
    map['name'] = name;
    map['age'] = age;
    map['sex'] = sex;
    map['phone'] = phone;
    map['hobby'] = hobby;
    map['address'] = address;
    String url = 'http://127.0.0.1:7001/api/form/add';
    var response = await Dio().post(url, data: jsonEncode(map));
    var data = jsonDecode(response.toString());
    if (data['code'] == 200) {
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(hintText: '请输入姓名'),
                onChanged: (value) {
                  setState(() {
                    name = value.toString();
                  });
                },
                validator: (String? value) {
                  // ignore: unnecessary_null_comparison
                  return value.toString().length == 0 ? '姓名不能为空' : null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: '请输入年龄'),
                onChanged: (value) {
                  setState(() {
                    age = value.toString();
                  });
                },
                validator: (String? value) {
                  return value.toString().length >= 3 ? '您输入的年龄不合法' : null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: '请输入性别',
                ),
                onChanged: (value) {
                  setState(() {
                    sex = value.toLowerCase();
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: '请输入电话'),
                onChanged: (value) {
                  setState(() {
                    phone = value.toString();
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: '请输入爱好'),
                onChanged: (value) {
                  setState(() {
                    hobby = value.toString();
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: '请输入地址'),
                onChanged: (value) {
                  setState(() {
                    address = value.toString();
                  });
                },
              ),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                child: ElevatedButton(child: Text('确 定'), onPressed: handleOk),
              )
            ],
          )),
    );
  }
}
