import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:fdis_mobile/app/endpoints.dart';
import 'package:fdis_mobile/app/exception/exception_handling.dart';
import 'package:http/http.dart' as http;

class BaseClient {
  Map<String, String> requestHeaders = {
    'Content-Type': 'application/json',
    'Accept': '*/*',
  };
  Future<dynamic> get(String endpoint,{Map<String,String>? headerData}) async {
    try {
      log(Endpoints.baseUrl + endpoint);
      var response = await http.get(
        Uri.parse(Endpoints.baseUrl + endpoint),
        headers: headerData
      );
      log(response.statusCode.toString());
      log(response.body);
      return _getResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection", endpoint);
    } on TimeoutException {
      throw ApiNotRespondingException("Taking to longer to response", endpoint);
    }
  }

  Future<dynamic> post(String endpoint,
      {required Map<String, dynamic> body,
       Map<String, String>? headers}) async {
    try {
      log(Endpoints.baseUrl + endpoint);
      final response = await http.post(
        Uri.parse(Endpoints.baseUrl + endpoint),
        body: json.encode(body),
        headers: headers,
      );

      return _getResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection", endpoint);
    } on TimeoutException {
      throw ApiNotRespondingException("Taking to longer to response", endpoint);
    }
  }

   Future<http.Response?> postApi({
    String? url,
    required Map<String, dynamic> bodyData,
    Map<String, String>? headerData,
  }) async {
    try {
      http.Response response =
      await http.post(Uri.parse(url!), body: bodyData, headers: headerData);
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 400) {
        return response;
      } else if (response.statusCode == 401) {
        return response;
      } else if (response.statusCode == 404) {
        return response;
      } else if (response.statusCode == 500) {
        return response;
      }
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    } on TimeoutException {
      throw ApiNotRespondingException("Taking to longer to response");
    }
  }

  Future<dynamic> put(String endpoint,
      {required Map<String, dynamic> body,
      required Map<String, String> headers}) async {
    try {
      log(Endpoints.baseUrl + endpoint);
      final response = await http.put(
        Uri.parse(Endpoints.baseUrl + endpoint),
        body: json.encode(body),
        headers: headers,
      );
      log('Status code PUT');
      log(response.statusCode.toString());

      return _getResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection", endpoint);
    } on TimeoutException {
      throw ApiNotRespondingException("Taking to longer to response", endpoint);
    }
  }

  dynamic _getResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response;
      case 400:
      case 404:
        log("Bad Request");
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        log("un Authorised");
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      case 502:
      default:
        log("Server Error");
        throw FetchDataException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
    }
  }
}
