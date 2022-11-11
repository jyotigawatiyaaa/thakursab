class LoginResponse {
  bool? success;
  int? serverCode;
  String? message;
  LoginData? loginData;

  LoginResponse({this.success, this.serverCode, this.message, this.loginData});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    serverCode = json['serverCode'];
    message = json['message'];
    loginData = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['serverCode'] = serverCode;
    data['message'] = message;
    if (loginData != null) {
      data['data'] = loginData!.toJson();
    }
    return data;
  }
}

class LoginData {
  int? code;
  String? message;
  String? username;
  String? token;

  LoginData({this.code, this.message, this.username, this.token});

  LoginData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['Message'];
    username = json['Username'];
    token = json['Token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['Message'] = message;
    data['Username'] = username;
    data['Token'] = token;
    return data;
  }
}
