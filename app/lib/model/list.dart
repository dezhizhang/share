class ListModel {
  int code = 200;
  String msg = '成功';
  bool success = true;
  List<Data> data = [];
  int total = 10;

  ListModel(
      {required this.code,
      required this.msg,
      required this.success,
      required this.data,
      required this.total});

  ListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    success = json['success'];
    if (json['data'] != null) {
      // ignore: deprecated_member_use
      data = [];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int addTime = 0;
  String sId = '';
  String url = '';
  String title = '';
  String price = '';
  String status = '';
  String subtitle = '';
  int iV = 0;

  Data(
      {required this.addTime,
      required this.sId,
      required this.url,
      required this.title,
      required this.price,
      required this.status,
      required this.subtitle,
      required this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    addTime = json['add_time'];
    sId = json['_id'];
    url = json['url'];
    title = json['title'];
    price = json['price'];
    status = json['status'];
    subtitle = json['subtitle'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['add_time'] = this.addTime;
    data['_id'] = this.sId;
    data['url'] = this.url;
    data['title'] = this.title;
    data['price'] = this.price;
    data['status'] = this.status;
    data['subtitle'] = this.subtitle;
    data['__v'] = this.iV;
    return data;
  }
}
