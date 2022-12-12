import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../route/route.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> offsetAnimation;

  @override
  void onInit() {
    super.onInit();
    _controller =
        AnimationController(duration: const Duration(seconds: 0), vsync: this);
    offsetAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, 0.0)).animate(
            CurvedAnimation(parent: _controller, curve: Curves.decelerate));
  }

  @override
  void onReady() {
    super.onReady();
    _launchPage();
  }

  _launchPage() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    Get.offNamed(AppRoute.login);
  }
}
