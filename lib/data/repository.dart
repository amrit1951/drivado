import 'package:drivado/data/api.dart';
import '../helper/logger.dart';

final Api _api = Api();

class Repository {
  static usersApi() async {
    try {
      var res = await _api.makeRequest.get('/users');
      return res.data;
    } catch (e) {
      logger.e(e);
    }
  }

  static companyApi() async {
    try {
      var res = await _api.makeRequest.get('/company');
      return res.data;
    } catch (e) {
      logger.e(e);
    }
  }
}
