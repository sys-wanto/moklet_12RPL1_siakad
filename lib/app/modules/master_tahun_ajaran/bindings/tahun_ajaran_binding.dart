import 'package:get/get.dart';

import '../controllers/master_tahun_ajaran_controller.dart';

class TahunAjaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TahunAjaranController>(
      () => TahunAjaranController(),
    );
  }
}
