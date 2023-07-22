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
      'role': role
    };

    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RegisterModel>(
            Options(method: 'POST', headers: _header())
                .compose(_dio.options, LocaleKeys.signUpURL, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RegisterModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RegisterModel> businessInsert(
      {required int user_id,
      required String bussiness_name,
      required String contact_number,
      required String categorys,
      required String location_longlat,
      required String images,
      required String address}) async {
    final _data = {
      'user_id': user_id,
      'bussiness_name': bussiness_name,
      'contact_number': contact_number,
      'categorys': categorys,
      'location_longlat': location_longlat,
      'images': images,
      'address': address
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RegisterModel>(Options(
                method: 'POST', headers: _header())
            .compose(_dio.options, LocaleKeys.businessCreateURL, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RegisterModel.fromJson(_result.data!);
    return value;
  }

  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    final _data = {
      'email': email,
      'password': password,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<LoginModel>(Options(method: 'POST', headers: _header())
            .compose(_dio.options, LocaleKeys.loginUpURL, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginModel.fromJson(_result.data!);
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

  // @override
  // Future filesUpload( File document) async {
  //   var formData = FormData.fromMap({});
  //   var file = await MultipartFile.fromFile(document.path,
  //       filename: basename(document.path),
  //       contentType: MediaType("jpg", basename(document.path)));

  //   formData.files.add(MapEntry('file', file));

  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType(
  //           Options(method: 'POST', headers: _header())
  //               .compose(_dio.options, LocaleKeys.filesUpload, data: formData)
  //               .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   // final value = UploadDocumentResponse.fromJson(_result.data!);
  //   return _result;
  // }
}
