import 'package:get/get.dart';
import '../../../data/models/model_mapel.dart';
import '../../../data/repositories/repository_mapel.dart';

class MapelController extends GetxController {

  final count = 0.obs;
  Rx<bool> isLoaded = false.obs;
  Rx<ModelMapel> mapel = ModelMapel().obs;
  final list_test = [].obs;
  
  @override
  void onInit() {
    super.onInit();
    getMapel();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getMapel() {
    isLoaded(false);
    RepositoryMapel().loadMapel().then((ModelMapel response) {
      mapel(response);
      isLoaded(true);
    });
  }

  void increment() => count.value++;
}
