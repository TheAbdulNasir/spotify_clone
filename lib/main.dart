import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dependency_injection.dart';
import 'route/app_module.dart';
import 'route/route.dart';

void main() async {
  await Get.putAsync(() => GetStorage.init());
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          enableLog: true,
          theme: ThemeData(primaryColor: Colors.blue),
          initialRoute: AppRoute.splash,
          getPages: AppPage.routes);
}
