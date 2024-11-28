import 'package:basic_ecommerce_app/Controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBindigs extends Bindings {
  @override
  void dependencies() {
    Get.put(() => LoginController());
  }
}
