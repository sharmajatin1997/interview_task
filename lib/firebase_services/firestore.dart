
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:interview_task/helper/utils/utils.dart';
import 'package:interview_task/helper/utils_helper/get_storage.dart';
import 'package:interview_task/models/userModel.dart';

class FirebaseFire extends GetxController {
  Rxn<UserModel> userModel = Rxn();

  @override
  void onInit() {
    super.onInit();
  }

  final databaseUserPath = FirebaseFirestore.instance.collection('users');

  void saveUser(UserModel model) async {
    if (await Utils.hasNetwork()) {
      final userId = databaseUserPath.doc(model.uid);
      Map<String, dynamic> user = model.toJson();
      await userId.set(user);
    }
  }

  // void updateUserInfo(UserModel model, bool logout) async {
  //   if (await Utils.hasNetwork()) {
  //     isUpdate.value = true;
  //     final userId = databaseUserPath.doc(model.uid);
  //     Map<String, dynamic> user = model.toJson();
  //     if (logout) {
  //       user['deviceToken'] = ' ';
  //       await userId.update(user);
  //       googleSignIn.signOut();
  //       String fcm = SharedPreferenceHelper().getFcmToken()!;
  //       SharedPreferenceHelper().clearAll();
  //       SharedPreferenceHelper().saveFcm(true);
  //       if (SharedPreferenceHelper().getFcm()) {
  //         SharedPreferenceHelper().saveFcmToken(fcm);
  //       }
  //       Get.offAllNamed(Routes.login);
  //     } else {
  //       user['deviceToken'] = SharedPreferenceHelper().getFcmToken();
  //       await userId.update(user);
  //       getUserById(SharedPreferenceHelper().getUserId(), model);
  //     }
  //   }
  // }
  //

  Future<UserModel?> getUserById(uid) async {
    if (await Utils.hasNetwork()) {
      var response = await databaseUserPath.doc(uid).get();
      final data = response.data();
      if (data != null) {
        userModel.value = UserModel.fromJson(data);
        userModel.refresh();
        SharedPreferenceHelper().saveUserModel(userModel.value);
        return UserModel.fromJson(data);
      }else{
        return UserModel();
      }
    }
  }

}
