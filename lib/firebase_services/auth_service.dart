import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:interview_task/helper/utils_helper/get_storage.dart';
import 'package:interview_task/routes/app_pages.dart';

class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();

  @override
  void onInit() {
    firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  Future<UserCredential?> register(String email, String password) async {
    try {
      var res=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if(res.user!=null){
        return res;
      }else{
        return null;
      }
    } catch (e) {
      Get.snackbar('Register Error', e.toString());
      return null;
    }
  }

  Future<UserCredential?> login(String email, String password) async {
    try {
      var res=await _auth.signInWithEmailAndPassword(email: email, password: password);
      if(res.user!=null){
        return res;
      }else{
        return null;
      }
    } catch (e) {
      Get.snackbar('Login Error', e.toString());
      return null;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    SharedPreferenceHelper().clearAll();
    Get.toNamed(Routes.login);
  }
}
