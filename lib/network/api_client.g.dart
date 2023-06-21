part of 'api_client.dart';

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  Map<String, String> _header() {
    return {
      'Content-Type': 'application/json',
    };
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  // @override
  // Future<AppConstantResponse> getAppConstant(String token) async {
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<AppConstantResponse>(
  //           Options(method: 'GET', headers: _header(true))
  //               .compose(_dio.options, LocaleKeys.getAppConstant)
  //               .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = AppConstantResponse.fromJson(_result.data!);
  //   return value;
  // }

  @override
  Future<RegisterModel> register(
      {required String username,
      required String mobileNumber,
      required String email,
      required String password,
      required int role}) async {
    final _data = {
      'username': username,
      'mobileNumber': mobileNumber,
      'email': email,
      'password': password,
      'iRole': role
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RegisterModel>(
            Options(method: 'POST', headers: _header())
                .compose(_dio.options, LocaleKeys.signUpURL, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RegisterModel.fromJson(_result.data!);
    return value;
  }

  // @override
  // Future<CreateBusinessModel> updateMyBusiness(String token,
  //     {required int iBusinessId,
  //     required int iBusinessCategoryId,
  //     required String vBusinessName,
  //     required String vLogo,
  //     required String vCover,
  //     required String vBusinessAddress,
  //     required String vAltMobile,
  //     required bool isSelfEmployed,
  //     required String vOverview,
  //     required String vWebsite,
  //     required String vFacebook,
  //     required String vInstagram}) async {
  //   final _data = {
  //     'iBusinessId': iBusinessId,
  //     'iBusinessCategoryId': iBusinessCategoryId,
  //     'vBusinessName': vBusinessName,
  //     'vLogo': vLogo,
  //     'vCover': vCover,
  //     'vBusinessAddress': vBusinessAddress,
  //     'vAltMobile': vAltMobile,
  //     'isSelfEmployed': isSelfEmployed,
  //     'vOverview': vOverview,
  //     'vWebsite': vWebsite,
  //     'vFacebook': vFacebook,
  //     'vInstagram': vInstagram
  //   };

  // @override
  // Future<DeleteModel> deleteMyBusiness(String token,
  //     {required int iBusinessId}) async {
  //   final _data = {'iBusinessId': iBusinessId};

  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<DeleteModel>(
  //           Options(method: 'DELETE', headers: _header(true))
  //               .compose(_dio.options, LocaleKeys.getMyBusiness, data: _data)
  //               .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = DeleteModel.fromJson(_result.data!);
  //   return value;
  // }
}
