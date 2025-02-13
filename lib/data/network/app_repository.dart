import 'package:dio/dio.dart';
import 'package:mechtronz/constants/api_endpoints.dart';
import 'package:mechtronz/data/network/dio_client.dart';
import 'package:mechtronz/modal/api_response.dart';
import 'package:mechtronz/modal/assets/asset_response.dart';
import 'package:mechtronz/modal/assets/assets_list_response.dart';
import 'package:mechtronz/modal/assets/assets_type.dart';
import 'package:mechtronz/modal/assets/create_assets_request.dart';
import 'package:mechtronz/modal/assets/create_assets_response.dart';
import 'package:mechtronz/modal/genarate_otp_request.dart';
import 'package:mechtronz/modal/id_request.dart';
import 'package:mechtronz/modal/otp_response.dart';
import 'package:mechtronz/modal/pagination_params.dart';
import 'package:mechtronz/modal/sign_in_request.dart';
import 'package:mechtronz/modal/sign_in_response.dart';
import 'package:mechtronz/modal/sign_up_request.dart';
import 'package:mechtronz/modal/sign_up_response.dart';
import 'package:mechtronz/modal/user_response.dart';
import 'package:mechtronz/modal/validate_otp_request.dart';

class AppRepository {
  DioClient? dioClient;
  Options? option;
  // PreferenceConnector? preferenceConnector;

  AppRepository() {
    dioClient = DioClient(Dio());
    option = Options(headers: {
      "Content-Type": "application/json",
    });
    // preferenceConnector = PreferenceConnector();
  }

  //
  // Future<LoginResponse> loginAppUser(LoginRequest loginRequest) async {
  //   Helper.printLogValue("Login request: ${jsonEncode(loginRequest.toJson())}");
  //   return LoginResponse.fromJson((await dioClient!.post(
  //     ApiEndpoints.baseUrl + ApiEndpoints.authenticate,
  //     data: loginRequest,
  //     options: option,
  //   )));
  // }

  //auth module
  Future<SignUpResponse> signUp(SignUpRequest signUpRequest) async {
    return SignUpResponse.fromJson((await dioClient!.post(
      ApiEndpoints.signUp,
      data: FormData.fromMap(signUpRequest.toJson()),
      options: option?.copyWith(
        headers: {
          "Content-Type": "multipart/form-data",
        },
      ),
    )));
  }

  Future<SignInResponse> signIn(SignInRequest signInRequest) async {
    return SignInResponse.fromJson(
        (await dioClient!.post(ApiEndpoints.signIn,
            data: (signInRequest.toJson()), options: option)),
        (data) => SignInResult.fromJson(data));
  }

  //otp module
  Future<OtpResponse> genarateOtp(
    GenarateOtpRequest genarateOtpRequest,
  ) async {
    return OtpResponse.fromJson((await dioClient!.post(
      ApiEndpoints.genarateOtp,
      data: genarateOtpRequest.toJson(),
      options: option,
    )));
  }

  Future<OtpResponse> validateOtp(
    ValidateOtpRequest verifyOtpRequest,
  ) async {
    return OtpResponse.fromJson((await dioClient!.post(
      ApiEndpoints.validateOtp,
      data: verifyOtpRequest.toJson(),
      options: option,
    )));
  }

  //user module
  Future<UserResponse> getUser(int id) async {
    return UserResponse.fromJson(
      await dioClient!.get(
        ApiEndpoints.getUser,
        options: option,
        // queryParameters: IdRequest(id: id).toJson(),
      ),
      (data) => UserResult.fromJson(data),
    );
  }

  // assets module
  Future<CreateAssetsResponse> createAssets(
    CreateAssetsRequest createAssetsRequest,
  ) async {
    return CreateAssetsResponse.fromJson(
      (await dioClient!.post(
        ApiEndpoints.createAssets,
        data: FormData.fromMap(createAssetsRequest.toJson()),
        options: option,
      )),
      (data) => CreateAssetsResult.fromJson(data),
    );
  }

  Future<CreateAssetsResponse> updateAsset(
    CreateAssetsRequest createAssetsRequest,
    int id,
  ) async {
    return CreateAssetsResponse.fromJson(
      (await dioClient!.update(
        ApiEndpoints.updateAsset,
        data: FormData.fromMap(createAssetsRequest.toJson()),
        queryParameters: IdRequest(id: id).toJson(),
        options: option,
      )),
      (data) => CreateAssetsResult.fromJson(data),
    );
  }

  Future<ApiResponse> deleteAsset(IdRequest id) async {
    return ApiResponse.fromJson(
        (await dioClient!.delete(
          ApiEndpoints.deleteAsset,
          queryParameters: id.toJson(),
          options: option,
        )),
        (_) => null);
  }

  Future<AssetResponse> getAssetList(int skip, int limit) async {
    return AssetResponse.fromJson(
      (await dioClient!.get(
        ApiEndpoints.assetList,
        options: option,
        queryParameters: PaginationParam(
          maxResultCount: limit,
          skipCount: skip,
        ).toJson(),
      )),
      (data) => AssetResult.fromJson(data),
    );
  }

  Future<AllAssetTypeResponse> getAllAssetsType(int limit, int skip) async {
    return AllAssetTypeResponse.fromJson(
      (await dioClient!.get(
        ApiEndpoints.assetType,
        options: option,
        queryParameters: PaginationParam(
          maxResultCount: limit,
          skipCount: skip,
        ).toJson(),
      )),
      (data) => AssetTypeResult.fromJson(data),
    );
  }

  Future<AssetTypeResponse> getAssetsType(int id) async {
    return AssetTypeResponse.fromJson(
      (await dioClient!.get(
        ApiEndpoints.getAssetTypeById,
        options: option,
        queryParameters: IdRequest(id: id).toJson(),
      )),
      (data) => AssetType.fromJson(data),
    );
  }
}
