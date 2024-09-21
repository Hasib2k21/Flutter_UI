import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:practice/state_holders/bottom_navbar_controller.dart';

class ControllerBinders extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>BottomNavbarController());
  }
}