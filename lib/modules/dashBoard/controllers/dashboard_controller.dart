import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:interview_task/firebase_services/auth_service.dart';
import 'package:interview_task/firebase_services/firestore.dart';
import 'package:interview_task/models/userModel.dart';



class DashboardController extends GetxController {

  final auth = Get.find<AuthService>();
  final firebase = Get.find<FirebaseFire>();

  Rxn<UserModel> model=Rxn();

  var isLoadingData = false.obs;

  Future getData(String uid)async{
    isLoadingData.value=true;
    var res=await firebase.getUserById(uid);
    if(res?.uid!=null){
      model.value=res!;
      model.refresh();
    }
  }

  }
