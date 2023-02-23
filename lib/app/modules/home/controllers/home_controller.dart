import 'dart:async';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import '../../login/views/login_view.dart';

class HomeController extends GetxController {
      late Timer _pindah ;

  //TODO: Implement HomeController

  // final count = 0.obs;
  final authToken = GetStorage();
  @override
  void onInit() {
    _pindah = Timer.periodic(
  const Duration(seconds: 4),
  (timer) => Get.off(
    () =>  LoginView(),
    transition: Transition.leftToRight,
  ),
  // late Timer _pindah = Timer.periodic(
  //   const Duration(seconds: 4),
  //   (timer) => Get.off(
  //     () => LoginView(),
  //     transition: Transition.leftToRight,
  //   ),
  // );
);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    var _pindah;
    _pindah.cancel();
  }
  // void increment() => count.value++;
}
