import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../controller/login_controller.dart';
import '../../resource/color.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: loginBGColor,
      body: Center(child: Padding(
        padding: EdgeInsets.all(Get.width/5.0),
        child: GestureDetector(
          onTap: () async {
            controller.getAccessToken();
          },
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: buttonColor
              ),
              child: const Center(
                  child: Text('Login with Spotify',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color:Colors.white))),
            ),
          ),
        ),
      )),
    );
  }
}
