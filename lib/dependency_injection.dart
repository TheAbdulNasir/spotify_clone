import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'shared/get_storage_repository.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<GetStorage>(() => GetStorage(), fenix: true);
    Get.lazyPut<GetStorageRepository>(() => GetStorageRepository(Get.find()),
        fenix: true);
  }
}
