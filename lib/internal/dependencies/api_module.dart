import 'package:eclipse_app/data/api/api_util.dart';
import 'package:eclipse_app/data/api/service/eclipse_service.dart';

class ApiModule {
  static ApiUtil _apiUtil;

  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(EclipseService());
    }
    return _apiUtil;
  }
}
