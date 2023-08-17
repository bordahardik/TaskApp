// ignore_for_file: prefer_typing_uninitialized_variables, unnecessary_new, prefer_interpolation_to_compose_strings
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../apis/api_exception.dart';
import 'base_service.dart';

enum APIType { aPost, aGet, aDelete, aPut }

/// USE HTTP TO API CALLING
class ApiService extends BaseService {
  var response;

  Future<dynamic> getResponse({
    @required APIType? apiType,
    @required String? url,
  }) async {
    try {
      logs("URL ---> ${Uri.parse(baseURL + url!)}");
      logs('API TYPE :$apiType');

      ///------------------------------------ GET METHOD -------------------------------------///
      if (apiType == APIType.aGet) {
        var result = await http.get(
          Uri.parse(baseURL + url),
        );
        response = returnResponse(
          result.statusCode,
          result.body,
        );
        logs("Get response......$response");
      }

      return response;
    } catch (e) {
      logs('Error=>.. $e');
    }
  }

  dynamic returnResponse(int status, String result) {
    switch (status) {
      case 200:
        return jsonDecode(result);
      case 400:
        throw BadRequestException('Bad Request');
      case 401:
        throw UnauthorisedException('Unauthorised user');
      case 404:
        throw ServerException('Server Error');
      case 500:
      default:
        throw FetchDataException('Internal Server Error');
    }
  }
}

logs(String message) {
  if (kDebugMode) {
    log(message);
  }
}
