class CompanyDetailResponse {
  bool? success;
  int? serverCode;
  String? message;
  List<CompanyDetailList>? companyDetailList;

  CompanyDetailResponse(
      {this.success, this.serverCode, this.message, this.companyDetailList});

  CompanyDetailResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    serverCode = json['serverCode'];
    message = json['message'];
    if (json['data'] != null) {
      companyDetailList = <CompanyDetailList>[];
      json['data'].forEach((v) {
        companyDetailList!.add(CompanyDetailList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    data['serverCode'] = this.serverCode;
    data['message'] = this.message;
    if (this.companyDetailList != null) {
      data['data'] = this.companyDetailList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompanyDetailList {
  String? auditCode;
  String? companyName;
  String? type;
  String? locationName;
  String? categoryId;
  String? categoryName;

  CompanyDetailList(
      {this.auditCode,
        this.companyName,
        this.type,
        this.locationName,
        this.categoryId,
        this.categoryName});

  CompanyDetailList.fromJson(Map<String, dynamic> json) {
    auditCode = json['AuditCode'];
    companyName = json['CompanyName'];
    type = json['Type'];
    locationName = json['Location_Name'];
    categoryId = json['CategoryId'];
    categoryName = json['CategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['AuditCode'] = this.auditCode;
    data['CompanyName'] = this.companyName;
    data['Type'] = this.type;
    data['Location_Name'] = this.locationName;
    data['CategoryId'] = this.categoryId;
    data['CategoryName'] = this.categoryName;
    return data;
  }
}
