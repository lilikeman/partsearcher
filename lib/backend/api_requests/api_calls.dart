import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetPartsSearchDataCall {
  static Future<ApiCallResponse> call({
    String? oEMPartNumber = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getPartsSearchData',
      apiUrl: 'https://us-central1-h-startup.cloudfunctions.net/getpart',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'OEM_part_number': oEMPartNumber,
        'uid': "8e856f61cc464235b308f46dc0bd1c32",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetPartsImageDataCall {
  static Future<ApiCallResponse> call({
    String? picUid = '',
    String? fileName = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getPartsImageData',
      apiUrl:
          'https://storage.googleapis.com/h-startup_pub_picture/pictures/${picUid}/${fileName}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetRecommendPartsImageCall {
  static Future<ApiCallResponse> call({
    List<String>? epikUidList,
  }) {
    final epikUid = _serializeList(epikUidList);

    return ApiManager.instance.makeApiCall(
      callName: 'getRecommendPartsImage',
      apiUrl:
          'https://storage.googleapis.com/h-startup_pub_picture/pictures/${epikUid}/1.png',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
