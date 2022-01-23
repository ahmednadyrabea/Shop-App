import 'package:get/get.dart';
import 'package:shop/view%20model/auth_view_model.dart';
import 'package:shop/view%20model/home_view_model.dart';

class Binings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewMModel());
  }
}
