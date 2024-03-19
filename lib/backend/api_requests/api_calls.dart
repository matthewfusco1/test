import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Replicate APIs  Group Code

class ReplicateAPIsGroup {
  static String baseUrl = 'https://api.replicate.com/v1';
  static Map<String, String> headers = {
    'Authorization': 'Token r8_Ib1obIqINI9cQ1LPZWW6Qxcpkq6HjQQ3kqvaC',
  };
  static CreateCall createCall = CreateCall();
  static GetCall getCall = GetCall();
}

class CreateCall {
  Future<ApiCallResponse> call({
    String? prompt = '',
    String? image = '',
  }) async {
    final ffApiRequestBody = '''
{
  "eta": 0,
  "seed": 20,
  "image": "$image",
  "scale": 9,
  "steps": 20,
  "prompt": "$prompt",
  "scheduler": "DDIM",
  "structure": "scribble",
  "num_outputs": 1,
  "low_threshold": 100,
  "high_threshold": 200,
  "negative_prompt": "Longbody, lowres, bad anatomy, bad hands, missing fingers, extra digit, fewer digits, cropped, worst quality, low quality",
  "image_resolution": 512,
  "return_reference_image": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create',
      apiUrl: '${ReplicateAPIsGroup.baseUrl}/predictions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Token r8_Ib1obIqINI9cQ1LPZWW6Qxcpkq6HjQQ3kqvaC',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class GetCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get',
      apiUrl: '${ReplicateAPIsGroup.baseUrl}/predictions/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Token r8_Ib1obIqINI9cQ1LPZWW6Qxcpkq6HjQQ3kqvaC',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? outputImageURLs(dynamic response) => (getJsonField(
        response,
        r'''$.output''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
}

/// End Replicate APIs  Group Code

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

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
