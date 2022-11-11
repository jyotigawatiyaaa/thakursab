class AllAuditResponse {
  bool? success;
  int? serverCode;
  String? message;
  List<AllAuditList>? allAuditList;

  AllAuditResponse(
      {this.success, this.serverCode, this.message, this.allAuditList});

  AllAuditResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    serverCode = json['serverCode'];
    message = json['message'];
    if (json['data'] != null) {
      allAuditList = <AllAuditList>[];
      json['data'].forEach((v) {
        allAuditList!.add(AllAuditList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    data['serverCode'] = this.serverCode;
    data['message'] = this.message;
    if (this.allAuditList != null) {
      data['data'] = this.allAuditList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllAuditList {
  String? id;
  String? auditCode;
  String? locationClientId;
  String? nameClientId;

  AllAuditList(
      {this.id, this.auditCode, this.locationClientId, this.nameClientId});

  AllAuditList.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    auditCode = json['AuditCode'];
    locationClientId = json['LocationClient_Id'];
    nameClientId = json['NameClient_Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Id'] = this.id;
    data['AuditCode'] = this.auditCode;
    data['LocationClient_Id'] = this.locationClientId;
    data['NameClient_Id'] = this.nameClientId;
    return data;
  }
}
