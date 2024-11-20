import 'package:drivado/data/repository.dart';
import 'package:get/get.dart';

import '../helper/logger.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  RxBool userSelected = true.obs;
  var userList = [].obs;
  var companyList = [].obs;

  Future<void> fetchUserData() async {
    try {
      isLoading(true);
      final res = await Repository.usersApi();
      userList.value = res;
    } catch (e) {
      logger.e("error: $e");
    }
  }

  Future<void> fetchCompanyData() async {
    try {
      isLoading(true);
      final res = await Repository.companyApi();
      companyList.value = res;
    } catch (e) {
      logger.e("error: $e");
    }
  }
}
