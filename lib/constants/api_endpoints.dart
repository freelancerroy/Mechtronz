class ApiEndpoints {
  ApiEndpoints._();

  static const String _baseUrl = 'http://13.61.229.126:8001';
  static String url(String path) => '$_baseUrl$path';

  static String signUp = url('/api/services/app/User/Create');
  static String signIn = url('/api/TokenAuth/Authenticate');

  static String genarateOtp = url('/api/services/app/OtpService/GenerateOtp');
  static String validateOtp = url('/api/services/app/OtpService/ValidateOtp');

  static String getUser =
      url('/api/services/app/Session/GetCurrentLoginInformations');

  static String assetType = url('/api/services/app/AssetTypes/GetAll');
  static String getAssetTypeById =
      url('/api/services/app/AssetTypes/GetAssetTypeById');
  static String createAssets = url('/api/services/app/AssetDetails/Create');
  static String updateAsset = url('/api/services/app/AssetDetails/Update');
  static String deleteAsset = url('/api/services/app/AssetDetails/Delete');
  static String assetList =
      url('/api/services/app/AssetDetails/GetAssetsByCustomer');
}
