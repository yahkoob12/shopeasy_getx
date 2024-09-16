import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:shopeasy_getx/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
