class ColorsModel {
  Data? data;
  String? message;
  String? responseCode;


  ColorsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    responseCode = json['responseCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['responseCode'] = this.responseCode;
    return data;
  }
}

class Data {
  int? totalItems;
  List<ApColors>? apColors;


  Data.fromJson(Map<String, dynamic> json) {
    totalItems = json['totalItems'];
    if (json['ApColors'] != null) {
      apColors = <ApColors>[];
      json['ApColors'].forEach((v) {
        apColors!.add(new ApColors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalItems'] = this.totalItems;
    if (this.apColors != null) {
      data['ApColors'] = this.apColors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ApColors {
  String? name;
  String? code;
  int? iD;

  ApColors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    iD = json['ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['ID'] = this.iD;
    return data;
  }
}
