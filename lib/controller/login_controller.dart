import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:spotifyclone/shared/get_storage_repository.dart';
import '../resource/constant_string.dart';
import '../route/route.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

class LoginController extends GetxController {
  GetStorageRepository getStorageRepository;
  LoginController(this.getStorageRepository);


  Future<String> getAccessToken() async {
    try {
      var authenticationToken = await SpotifySdk.getAccessToken(
          clientId: clientId,
          redirectUrl: callbackUrl,
          scope: 'app-remote-control, '
              'user-modify-playback-state, '
              'playlist-read-private, '
              'playlist-modify-public,user-read-currently-playing');
      debugPrint('Got a token: $authenticationToken');
      getStorageRepository.write(tokenSession, authenticationToken);
      Get.offAllNamed(AppRoute.home, arguments: authenticationToken);
      return authenticationToken;
    } on PlatformException catch (e) {
      debugPrint('${e.code}' '-' '${e.message}');
      return Future.error('$e.code: $e.message');
    } on MissingPluginException {
      debugPrint('not implemented');
      return Future.error('not implemented');
    }
  }
}
