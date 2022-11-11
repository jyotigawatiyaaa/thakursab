class AreaByCategoryIdModel {
  bool? success;
  int? serverCode;
  String? message;
  List<AreaByCatData>? data;

  AreaByCategoryIdModel(
      {this.success, this.serverCode, this.message, this.data});

  AreaByCategoryIdModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    serverCode = json['serverCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AreaByCatData>[];
      json['data'].forEach((v) {
        data!.add(AreaByCatData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    data['serverCode'] = this.serverCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AreaByCatData {
  String? categoryId;
  int? areaDescId;
  int? areaDescModuleId;
  String? name;

  AreaByCatData({this.categoryId, this.areaDescId, this.areaDescModuleId, this.name});

  AreaByCatData.fromJson(Map<String, dynamic> json) {
    categoryId = json['CategoryId'];
    areaDescId = json['AreaDescId'];
    areaDescModuleId = json['AreaDescModuleId'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['CategoryId'] = this.categoryId;
    data['AreaDescId'] = this.areaDescId;
    data['AreaDescModuleId'] = this.areaDescModuleId;
    data['Name'] = this.name;
    return data;
  }
}
