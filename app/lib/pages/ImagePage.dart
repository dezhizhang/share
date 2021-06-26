import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  var _image;
  takePhoto() async {
    var image = ImagePicker.platform.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  _uploadImage() async {
    FormData formData = new FormData.fromMap({
      "name": "zhangsan",
      "age": 20,
      "sex": "男",
      "file": await MultipartFile.fromFile(_image as String)
    });

    var res =
        await Dio().post('http://jd.itying.com/imgupload', data: formData);
  }

  _openGallery() async {
    var image = ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              child: Text('上传文件'),
              onPressed: _uploadImage,
            ),
          ],
        ),
      ),
    );
  }
}
