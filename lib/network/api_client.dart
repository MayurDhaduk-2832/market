import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/modules/login/model/login_view_model.dart';
import 'package:sellproducts/modules/register/model/register_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sellproducts/network/interceptor/api_interceptor.dart';
import 'package:sellproducts/network/interceptor/cache_interceptor.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  static late ApiClient _instance;
  static late Dio dio;
  static const bool doWriteLog = true;
  static const bool doEncryption = false;

  static ApiClient get instance => _instance;

  factory ApiClient._private(Dio dio, {String baseUrl}) = _ApiClient;

  // @GET(LocaleKeys.getAppConstant)
  // Future<AppConstantResponse> getAppConstant(String token);

  static Future<void> init() async {
    var options = BaseOptions(
      baseUrl: LocaleKeys.baseURL,
      connectTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 60000),
      sendTimeout: const Duration(milliseconds: 60000),
      headers: {
        "Content-Type": "application/json",
        "Accept": 'application/json'
      },
    );
    dio = Dio(options);
    dio.interceptors.addAll([
      ApiInterceptor(doEncryption: doEncryption, doWriteLog: doWriteLog),
      CacheInterceptor(),
    ]);
    _instance = ApiClient._private(dio, baseUrl: LocaleKeys.baseURL);
  }

  @POST(LocaleKeys.signUpURL)
  Future<RegisterModel> register(
      {@Field("username") required String username,
      @Field("mobileNumber") required String mobileNumber,
      @Field("email") required String email,
      @Field("password") required String password,
      @Field("role") required int role});

  @POST(LocaleKeys.loginUpURL)
  Future<LoginModel> login(
      {@Field("email") required String email,
        @Field("password") required String password,
       });

  // @POST(LocaleKeys.loginNew)
  // Future<LoginResponse> loginNew({@Field("vMobile") required String vMobile});

  // @POST(LocaleKeys.verifyOTP)
  // Future<LoginResponse> verifyOtp(
  //     {@Field("vMobile") required String vMobile,
  //     @Field("vOTP") required String vOTP});

  // @POST(LocaleKeys.loginById)
  // Future<LoginResponse> loginById({
  //   @Field("vId") required String vId,
  //   @Field("iAppVersion") required String iAppVersion,
  //   @Field("vDeviceModel") required String vDeviceModel,
  //   @Field("vDeviceBrand") required String vDeviceBrand,
  //   @Field("vDeviceVersion") required String vDeviceVersion,
  //   @Field("vDevice") required String vDevice,
  // });

  // @POST(LocaleKeys.signup)
  // Future<UserCreateResponse> signup(String token, FormData formData);

  //For Business

  // @GET(LocaleKeys.getMyBusiness)
  // Future<MyBusinessModel> getMyBusiness(String token,
  //     {@Field("vTimestamp") required String vTimeStamp});

  // @POST(LocaleKeys.getMyBusiness)
  // Future<CreateBusinessModel> addMyBusiness(String token,
  //     {@Field("iBusinessCategoryId") required int iBusinessCategoryId,
  //     @Field("vBusinessName") required String vBusinessName,
  //     @Field("vLogo") required String vLogo,
  //     @Field("vCover") required String vCover,
  //     @Field("vBusinessAddress") required String vBusinessAddress,
  //     @Field("vAltMobile") required String vAltMobile,
  //     @Field("isSelfEmployed") required bool isSelfEmployed,
  //     @Field("vOverview") required String vOverview,
  //     @Field("vWebsite") required String vWebsite,
  //     @Field("vFacebook") required String vFacebook,
  //     @Field("vInstagram") required String vInstagram});

  // @PUT(LocaleKeys.getMyBusiness)
  // Future<CreateBusinessModel> updateMyBusiness(String token,
  //     {@Field("iBusinessId") required int iBusinessId,
  //     @Field("iBusinessCategoryId") required int iBusinessCategoryId,
  //     @Field("vBusinessName") required String vBusinessName,
  //     @Field("vLogo") required String vLogo,
  //     @Field("vCover") required String vCover,
  //     @Field("vBusinessAddress") required String vBusinessAddress,
  //     @Field("vAltMobile") required String vAltMobile,
  //     @Field("isSelfEmployed") required bool isSelfEmployed,
  //     @Field("vOverview") required String vOverview,
  //     @Field("vWebsite") required String vWebsite,
  //     @Field("vFacebook") required String vFacebook,
  //     @Field("vInstagram") required String vInstagram});

  // @DELETE(LocaleKeys.getMyBusiness)
  // Future<DeleteModel> deleteMyBusiness(String token,
  //     {@Field("iBusinessId") required int iBusinessId});

  @POST(LocaleKeys.businessCreateURL)
  businessInsert({
    @Field("user_id") required int user_id,
    @Field("bussiness_name") required String bussiness_name,
    @Field("contact_number") required String contact_number,
    @Field("categorys") required String categorys,
    @Field("address") required String address,
    @Field("location_longlat") required String location_longlat,
    @Field("images") required String images,
  });

  // @POST(LocaleKeys.filesUpload)
  // @MultiPart()
  // Future filesUpload(@Part(name: "file") File document);
}
