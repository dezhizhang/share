import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:image_picker/image_picker.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('image'),
      ),
      body: ImageContent(),
    );
  }
}

class ImageContent extends StatefulWidget {
  _ImageContent createState() => _ImageContent();
}

class _ImageContent extends State<ImageContent> {
  List list = [];
  var _image;
  takePhoto() async {
    var pickedFile =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    _uploadImage(pickedFile!);
  }

  _uploadImage(PickedFile file) async {
    String path = file.path;
    var name = path.substring(path.lastIndexOf('/') + 1, path.length);
    print('------');
    print(path);
    print(name);
    print('------');

    FormData formData = new FormData.fromMap({
      "name": "zhangsan",
      "age": 20,
      "sex": "男",
      "url": await MultipartFile.fromFile(path, filename: name),
    });
    print('++++++');
    print(formData);
    print('++++++');
    var response = await Dio()
        .post("http://www.xiaozhi.shop/api/image/upload", data: formData);
    print('=============');

    print(response);
    print('============');

    //开始上传
  }

  _openGallery() async {
    var image = ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  downLoad() async {
    Response response =
        await Dio().get('http://www.xiaozhi.shop/api/image/download');
    var data = json.decode(response.toString());
    if (data['code'] == 200) {
      setState(() {
        list = data['data'];
      });
    }
    // var data = json.decode(response.data.toString());
    // print('------');
    // print(data);
    // print('------');
    // if (data['code'] == 200) {
    //   setState(() {
    //     list = data['data'];
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    print(list);
    print(this._image);
    // TODO: implement build
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text('拍照'),
              onPressed: takePhoto,
            ),
            ElevatedButton(
              child: Text('选择相册'),
              onPressed: _openGallery,
            ),
            ElevatedButton(
              child: Text('下载图片'),
              onPressed: downLoad,
            ),
            Container(
                width: 750,
                height: 400,
                child: list.length > 0
                    ? Image.network(
                        'http://www.xiaozhi.shop${list[list.length - 1]['url']}')
                    : Center(
                        child: Text('请下载图片'),
                      ))
          ],
        ),
      ),
    );
  }
}
