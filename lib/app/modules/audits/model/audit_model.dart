class AllCompanyResponse {
  bool? success;
  int? serverCode;
  String? message;
  CompanyList? companyList;

  AllCompanyResponse({this.success, this.serverCode, this.message, this.companyList});

  AllCompanyResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    serverCode = json['serverCode'];
    message = json['message'];
    companyList = json['data'] != null ? CompanyList.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = this.success;
    data['serverCode'] = this.serverCode;
    data['message'] = this.message;
    if (this.companyList != null) {
      data['data'] = this.companyList!.toJson();
    }
    return data;
  }
}

class CompanyList {
  int? count;
  List<Rows>? rows;

  CompanyList({this.count, this.rows});

  CompanyList.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = this.count;
    if (this.rows != null) {
      data['rows'] = this.rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  String? auditCode;
  String? date;
  bool? isActive;
  bool? isDone;
  String? id;
  String? type;
  String? nameClientId;
  String? locationClientId;
  String? presentClient;
  String? lastControlDate;
  bool? activate;
  String? locationManagerSignImage;
  AuditHash? auditHash;
  UserClient? userClient;
  Location? location;

  Rows(
      {this.auditCode,
        this.date,
        this.isActive,
        this.isDone,
        this.id,
        this.type,
        this.nameClientId,
        this.locationClientId,
        this.presentClient,
        this.lastControlDate,
        this.activate,
        this.locationManagerSignImage,
        this.auditHash,
        this.userClient,
        this.location});

  Rows.fromJson(Map<String, dynamic> json) {
    auditCode = json['AuditCode'];
    date = json['Date'];
    isActive = json['IsActive'];
    isDone = json['IsDone'];
    id = json['Id'];
    type = json['Type'];
    nameClientId = json['NameClient_Id'];
    locationClientId = json['LocationClient_Id'];
    presentClient = json['PresentClient'];
    lastControlDate = json['LastControlDate'];
    activate = json['Activate'];
    locationManagerSignImage = json['LocationManagerSignImage'];
    auditHash = json['AuditHash'] != null
        ? AuditHash.fromJson(json['AuditHash'])
        : null;
    userClient = json['UserClient'] != null
        ? UserClient.fromJson(json['UserClient'])
        : null;
    location = json['Location'] != null
        ? Location.fromJson(json['Location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['AuditCode'] = this.auditCode;
    data['Date'] = this.date;
    data['IsActive'] = this.isActive;
    data['IsDone'] = this.isDone;
    data['Id'] = this.id;
    data['Type'] = this.type;
    data['NameClient_Id'] = this.nameClientId;
    data['LocationClient_Id'] = this.locationClientId;
    data['PresentClient'] = this.presentClient;
    data['LastControlDate'] = this.lastControlDate;
    data['Activate'] = this.activate;
    data['LocationManagerSignImage'] = this.locationManagerSignImage;
    if (this.auditHash != null) {
      data['AuditHash'] = this.auditHash!.toJson();
    }
    if (this.userClient != null) {
      data['UserClient'] = this.userClient!.toJson();
    }
    if (this.location != null) {
      data['Location'] = this.location!.toJson();
    }
    return data;
  }
}

class AuditHash {
  String? type;
  List<int>? data;

  AuditHash({this.type, this.data});

  AuditHash.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    data = json['data'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this.type;
    data['data'] = this.data;
    return data;
  }
}

class UserClient {
  String? id;
  String? companyName;
  String? contactPerson;
  String? phone;
  Null? mobile;
  Null? fax;
  String? streetName;
  String? zipCode;
  String? city;
  String? state;
  Null? countryId;
  String? branchId;
  String? uRLClientPortal;
  int? reportType;
  Null? country;
  Branch? branch;

  UserClient(
      {this.id,
        this.companyName,
        this.contactPerson,
        this.phone,
        this.mobile,
        this.fax,
        this.streetName,
        this.zipCode,
        this.city,
        this.state,
        this.countryId,
        this.branchId,
        this.uRLClientPortal,
        this.reportType,
        this.country,
        this.branch});

  UserClient.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    companyName = json['CompanyName'];
    contactPerson = json['ContactPerson'];
    phone = json['Phone'];
    fax = json['Fax'];
    streetName = json['StreetName'];
    zipCode = json['ZipCode'];
    city = json['City'];
    state = json['State'];
    branchId = json['Branch_Id'];
    uRLClientPortal = json['URLClientPortal'];
    reportType = json['ReportType'];
    branch =
    json['Branch'] != null ? Branch.fromJson(json['Branch']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Id'] = this.id;
    data['CompanyName'] = this.companyName;
    data['ContactPerson'] = this.contactPerson;
    data['Phone'] = this.phone;
    data['Mobile'] = this.mobile;
    data['Fax'] = this.fax;
    data['StreetName'] = this.streetName;
    data['ZipCode'] = this.zipCode;
    data['City'] = this.city;
    data['State'] = this.state;
    data['CountryId'] = this.countryId;
    data['Branch_Id'] = this.branchId;
    data['URLClientPortal'] = this.uRLClientPortal;
    data['ReportType'] = this.reportType;
    data['Country'] = this.country;
    if (this.branch != null) {
      data['Branch'] = this.branch!.toJson();
    }
    return data;
  }
}

class Branch {
  String? id;
  String? branchName;

  Branch({this.id, this.branchName});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    branchName = json['BranchName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Id'] = this.id;
    data['BranchName'] = this.branchName;
    return data;
  }
}

class Location {
  String? id;
  String? name;
  int? size;
  String? clientId;
  String? region;
  String? city;
  String? address;
  String? contactPerson;
  bool? activate;
  String? email;

  Location(
      {this.id,
        this.name,
        this.size,
        this.clientId,
        this.region,
        this.city,
        this.address,
        this.contactPerson,
        this.activate,
        this.email});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    size = json['Size'];
    clientId = json['ClientId'];
    region = json['Region'];
    city = json['City'];
    address = json['Address'];
    contactPerson = json['ContactPerson'];
    activate = json['Activate'];
    email = json['Email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['Size'] = this.size;
    data['ClientId'] = this.clientId;
    data['Region'] = this.region;
    data['City'] = this.city;
    data['Address'] = this.address;
    data['ContactPerson'] = this.contactPerson;
    data['Activate'] = this.activate;
    data['Email'] = this.email;
    return data;
  }
}
