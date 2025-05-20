import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:interview_task/models/userModel.dart';

class SharedPreferenceHelper {

  static late GetStorage getStorage;

  static const String _userModel = "userModel";
  static const String _fcmToken = "fcmToken";
  static const String _userId = "userId";
  static const String _isLoggedIn = "isLoggedIn";
  static const String _userToken = "userToken";
  static const String _userName = "userName";


  static const JsonDecoder _decoder = JsonDecoder();
  static const JsonEncoder _encoder = JsonEncoder.withIndent('  ');

  static final SharedPreferenceHelper _singleton = SharedPreferenceHelper._internal();

  SharedPreferenceHelper._internal() {
    getStorage;
  }

  static Future<GetStorage?> init() async {
    await GetStorage.init("UBSold");
    getStorage = GetStorage("UBSold");
    return getStorage;
  }

  factory SharedPreferenceHelper() {
    return _singleton;
  }

  _savePref(String key, Object? value) async {
    var prefs = getStorage;
    if (prefs.hasData(key)) {
      prefs.remove(key);
    }
    if (value is bool) {
      return prefs.write(key, value);
    } else if (value is int) {
      return prefs.write(key, value);
    } else if (value is String) {
      return prefs.write(key, value);
    }
  }

  T _getPref<T>(String key) {
    return getStorage.read(key) as T;
  }

  void clearAll() {
    getStorage.erase();
  }


  String? getDeviceToken() {
    return _getPref(_fcmToken);
  }

  void saveDeviceToken(String? value) {
    _savePref(_fcmToken, value);
  }


  String? getUserId() {
    return _getPref(_userId);
  }

  void saveUserId(String? userId) {
    _savePref(_userId, userId);
  }


  String? getUserToken() {
    return _getPref(_userToken);
  }

  void saveUserToken(String? token) {
    _savePref(_userToken, token);
  }


  String? getUserName() {
    return _getPref(_userName);
  }

  void saveUserName(String? name) {
    _savePref(_userName, name);
  }

  UserModel? getUserModel() {
    String? user = _getPref(_userModel);
    if (user != null) {
      Map<String, dynamic>  userMap = _decoder.convert(user);
      return UserModel.fromJson(userMap);
    } else {
      return null;
    }
  }
  void saveUserModel(UserModel? userModel) {
    if (userModel != null) {
      String value = _encoder.convert(userModel);
      _savePref(_userModel, value);
    } else {
      _savePref(_userModel, null);
    }
  }

  bool getIsLoggedIn(){
    return _getPref(_isLoggedIn) ?? false;
  }

  void saveIsLoggedIn(bool value){
    _savePref(_isLoggedIn, value);
  }

}
