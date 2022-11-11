class CategoryByIdResponse {
  bool? success;
  int? serverCode;
  String? message;
  List<CategoryData>? data;

  CategoryByIdResponse(
      {this.success, this.serverCode, this.message, required this.data});

  CategoryByIdResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    serverCode = json['serverCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoryData>[];
      json['data'].forEach((v) {
        data!.add(CategoryData.fromJson(v));
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

class CategoryData {
  String? categoryId;
  String? categoryName;

  CategoryData({this.categoryId, this.categoryName});

  CategoryData.fromJson(Map<String, dynamic> json) {
    categoryId = json['CategoryId'];
    categoryName = json['CategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['CategoryId'] = this.categoryId;
    data['CategoryName'] = this.categoryName;
    return data;
  }
}
